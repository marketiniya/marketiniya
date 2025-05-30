import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/website/models/contact_model.dart';

class ContactRepository {
  ContactRepository(this._firestore);

  final FirestoreService _firestore;

  static const String _questions = 'questions';
  static const String _subscriptions = 'subscriptions';
  static const String _dateFormat = 'yyyy-MM-dd HH:mm:ss';

  Future<void> sendQuestion(ContactModel contactModel) async {
    try {
      await _firestore.createDocument(_questions, contactModel.toJson());
    } catch (e) {
      debugPrint('Error sending question to Firestore: $e');
      rethrow;
    }
  }

  Future<void> subscribe(String email) async {
    try {
      final querySnapshot = await _firestore.queryDocuments(
        _subscriptions,
        field: 'email',
        value: email,
      );

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('email-exists');
      }

      final data = <String, dynamic>{
        'email': email,
        'subscribedAt': DateFormat(_dateFormat).format(DateTime.now()),
      };

      await _firestore.createDocument(_subscriptions, data);
      debugPrint('User subscribed successfully.');
    } catch (e) {
      debugPrint('Error subscribing user: $e');
      rethrow;
    }
  }
}
