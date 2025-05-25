import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreService {
  FirestoreService._();

  static final FirestoreService instance = FirestoreService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///TODO: to add Tide's logger to every API call

  Future<DocumentSnapshot> getDocument(String collection, String docId) {
    return _firestore.collection(collection).doc(docId).get();
  }

  Future<String> createDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    final docRef = await _firestore.collection(collection).add(data);

    // Return the auto-generated ID of the newly created document used for objectId
    return docRef.id;
  }

  Future<void> updateDocument(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection(collection).doc(docId).update(data);
  }

  Future<QuerySnapshot> queryDocuments(
    String collection, {
    required String field,
    required dynamic value,
  }) {
    return _firestore.collection(collection).where(field, isEqualTo: value).get();
  }

  CollectionReference<Map<String, dynamic>> getCollection(String collection) {
    return _firestore.collection(collection);
  }
}
