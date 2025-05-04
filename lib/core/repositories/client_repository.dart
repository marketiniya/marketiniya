import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/services/firestore_service.dart';

@injectable
class ClientRepository {
  ClientRepository(this._firestore);

  final FirestoreService _firestore;

  static const String _clients = 'clients';

  Future<List<Client>> getClientsForUser(DocumentReference userRef) async {
    final querySnapshot = await _firestore
        .getCollection(_clients)
        .where('assignedTo', isEqualTo: userRef)
        .get();

    return querySnapshot.docs.map((doc) {
      return Client.fromFirestore(doc);
    }).toList();
  }

  Future<bool> isClientRegistered(String id) async {
    try {
      final doc = await _firestore.getDocument(_clients, id);
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<Client> createClient({
    required DocumentReference assignedTo,
    required List<DocumentReference> tags,
    required String companyName,
    required DateTime dateOfBirth,
    required String industry,
    required String personalOrCompanyId,
    required String phone,
    required ClientStatus status,
    required String description,
  }) async {
    final clientData = {
      'assignedTo': assignedTo,
      'tags': tags,
      'companyName': companyName,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'industry': industry,
      'personalOrCompanyId': personalOrCompanyId,
      'phone': phone,
      'status': status.label,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };

    await _firestore.createDocument(
      _clients,
      personalOrCompanyId,
      clientData,
    );

    final client = Client(
      assignedTo: assignedTo,
      tags: [],
      companyName: companyName,
      dateOfBirth: dateOfBirth,
      industry: industry,
      personalOrCompanyId: personalOrCompanyId,
      phone: phone,
      status: status,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return Future.value(client);
  }

  Future<Client> updateClient({
    required DocumentReference assignedTo,
    required String personalOrCompanyId,
    required String companyName,
    required DateTime dateOfBirth,
    required String industry,
    required String phone,
    required ClientStatus status,
    required String description,
  }) async {
    final clientData = {
      'companyName': companyName,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'industry': industry,
      'phone': phone,
      'status': status.label,
      'description': description,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    await _firestore.updateDocument(
      _clients,
      personalOrCompanyId,
      clientData,
    );

    final client = Client(
      assignedTo: assignedTo,
      tags: [], //TODO: update when tags available
      companyName: companyName,
      dateOfBirth: dateOfBirth,
      industry: industry,
      personalOrCompanyId: personalOrCompanyId,
      phone: phone,
      status: status,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return Future.value(client);
  }
}
