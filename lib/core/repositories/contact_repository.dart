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
      String docId = _generateDocId(contactModel.name);
      await _firestore.createDocument(_questions, docId, contactModel.toJson());
    } catch (e) {
      debugPrint('Error sending question to Firestore: $e');
      rethrow;
    }
  }

  Future<void> subscribe(String email) async {
    try {
      var querySnapshot = await _firestore.queryDocuments(
        _subscriptions,
        field: 'email',
        value: email,
      );

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('email-exists');
      }

      Map<String, dynamic> data = {
        'email': email,
        'subscribedAt': DateFormat(_dateFormat).format(DateTime.now()),
      };

      String docId = _generateDocId(email);
      await _firestore.createDocument(_subscriptions, docId, data);
      debugPrint('User subscribed successfully.');
    } catch (e) {
      debugPrint('Error subscribing user: $e');
      rethrow;
    }
  }

  String _generateDocId(String identifier) {
    String formattedDate = DateFormat(_dateFormat).format(DateTime.now());
    return '$formattedDate-$identifier';
  }
}
