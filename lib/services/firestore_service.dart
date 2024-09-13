import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/contact_model.dart';

class FirestoreService {
  // Private constructor
  FirestoreService._();

  // Singleton instance
  static final FirestoreService instance = FirestoreService._();

  static final FirebaseFirestore _firestore =  FirebaseFirestore.instance;

  static const String _questions = 'questions';

  Future<void> sendQuestionToFirestore(ContactModel contactModel) async {
    try {
      // Generate a human-readable document ID
      String formattedDate = DateFormat('yyyyMMdd:HH:mm:ss').format(DateTime.now());
      String docId = '$formattedDate-${contactModel.name}';

      await _firestore.collection(_questions).doc(docId).set(contactModel.toJson());

      debugPrint('Question added successfully with ID: $docId');
    } catch (e) {
      debugPrint('Failed to add question: $e');
    }
  }
}
