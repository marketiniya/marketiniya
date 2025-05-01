import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/services/firestore_service.dart';

@injectable
class ClientRepository {
  ClientRepository(this._firestore);

  final FirestoreService _firestore;

  static const String _clients = 'clients';

  Future<bool> isClientRegistered(String id) async {
    try {
      final doc = await _firestore.getDocument(_clients, id);
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<void> createClient({
    required DocumentReference assignedTo,
    required List<DocumentReference> tags,
    required String companyName,
    required DateTime dateOfBirth,
    required String industry,
    required String personalOrCompanyId,
    required String phone,
    required String status,
  }) async {
    try {
      final clientData = {
        'assignedTo': assignedTo,
        'tags': tags,
        'companyName': companyName,
        'dateOfBirth': Timestamp.fromDate(dateOfBirth),
        'industry': industry,
        'personalOrCompanyId': personalOrCompanyId,
        'phone': phone,
        'status': status,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.createDocument(
        _clients,
        personalOrCompanyId,
        clientData,
      );
    } catch (e) {
      throw Exception('Failed to create client: $e');
    }
  }
}
