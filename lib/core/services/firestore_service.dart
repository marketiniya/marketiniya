import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketinya/website/models/contact_model.dart';

class FirestoreService {
  FirestoreService._();

  static final FirestoreService instance = FirestoreService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _dateFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String _questions = 'questions';
  static const String _subscriptions = 'subscriptions';

  Future<DocumentSnapshot> getDocument(String collection, String docId) async {
    return await _firestore.collection(collection).doc(docId).get();
  }

  Future<void> setDocument(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection(collection).doc(docId).set(data);
  }

  Future<void> updateDocument(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection(collection).doc(docId).update(data);
  }

  Future<void> sendQuestion(ContactModel contactModel) async {
    try {
      String docId = _generateDocId(contactModel.name);
      await setDocument(_questions, docId, contactModel.toJson());
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
      await setDocument(_subscriptions, docId, data);
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
