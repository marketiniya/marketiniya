import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/website/models/contact_model.dart';

class ContactRepository {
  final FirestoreService _firestore = FirestoreService.instance;

  Future<void> sendQuestion(ContactModel contactModel) async {
    try {
      await _firestore.sendQuestion(contactModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> subscribe(String email) async {
    try {
      await _firestore.subscribe(email);
    } catch (e) {
      rethrow;
    }
  }
}
