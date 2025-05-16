import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/enums/priority_level.dart';
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
    required String name,
    required DateTime dateOfBirth,
    required BusinessSector businessSector,
    required String companyId,
    required String personalId,
    required String phone,
    required ClientStatus status,
    required PriorityLevel priorityLevel,
    required String description,
  }) async {
    final now = DateTime.now();

    final clientData = {
      'assignedTo': assignedTo,
      'tags': tags,
      'companyName': companyName,
      'name': name,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'businessSector': businessSector.label,
      'companyId': companyId,
      'personalId': personalId,
      'phone': phone,
      'status': status.label,
      'priorityLevel': priorityLevel.label,
      'description': description,
      'createdAt': Timestamp.fromDate(now),
      'updatedAt': Timestamp.fromDate(now),
    };

    final docId = await _firestore.createDocument(
      _clients,
      clientData,
    );

    final client = Client(
      id: docId,
      assignedTo: assignedTo,
      assignedToId: assignedTo.id,
      tags: tags,
      companyName: companyName,
      name: name,
      dateOfBirth: dateOfBirth,
      businessSector: businessSector,
      companyId: companyId,
      personalId: personalId,
      phone: phone,
      status: status,
      priorityLevel: priorityLevel,
      description: description,
      createdAt: now,
      updatedAt: now,
      tagIds: tags.map((tag) => tag.id).toList(),
    );

    return client;
  }

  Future<Client> updateClient({
    required String id,
    required DocumentReference assignedTo,
    required String companyId,
    required String personalId,
    required String companyName,
    required String name,
    required DateTime dateOfBirth,
    required BusinessSector businessSector,
    required String phone,
    required ClientStatus status,
    required PriorityLevel priorityLevel,
    required String description,
    required DateTime createdAt,
  }) async {
    final now = DateTime.now();

    final clientData = {
      'companyName': companyName,
      'name': name,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'businessSector': businessSector.label,
      'personalId': personalId,
      'companyId': companyId,
      'phone': phone,
      'status': status.label,
      'priorityLevel': priorityLevel.label,
      'description': description,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    // 'id' is the auto-generated document ID, also used as the unique identifier for the client.
    await _firestore.updateDocument(
      _clients,
      id,
      clientData,
    );

    final updatedClient = Client(
      id: id,
      assignedTo: assignedTo,
      tags: [], //TODO: update when tags available
      companyName: companyName,
      name: name,
      dateOfBirth: dateOfBirth,
      businessSector: businessSector,
      personalId: personalId,
      companyId: companyId,
      phone: phone,
      status: status,
      priorityLevel: priorityLevel,
      description: description,
      createdAt: createdAt,
      updatedAt: now,
      assignedToId: assignedTo.id,
    );

    return updatedClient;
  }
}
