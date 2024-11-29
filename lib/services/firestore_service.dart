import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/contact_model.dart';

class FirestoreService {
  FirestoreService._();

  static final FirestoreService instance = FirestoreService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _dateFormat = 'yyyy-MM-dd HH:mm:ss';

  static const String _questions = 'questions';
  static const String _subscriptions = 'subscriptions';

  Future<void> sendQuestion(ContactModel contactModel) async {
    try {
      String docId = _generateDocId(contactModel.name);
      await _firestore.collection(_questions).doc(docId).set(contactModel.toJson());
    } catch (e) {
      debugPrint('Error sending question to Firestore: $e');
      rethrow;
    }
  }

  Future<void> subscribe(String email) async {
    try {
      var querySnapshot = await _firestore
          .collection(_subscriptions)
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('email-exists');
      }

      Map<String, dynamic> data = {
        'email': email,
        'subscribedAt': DateFormat(_dateFormat).format(DateTime.now()),
      };

      String docId = _generateDocId(email);
      await _firestore.collection(_subscriptions).doc(docId).set(data);
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
