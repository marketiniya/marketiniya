import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/core/services/firebase_storage_service.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/department.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

@injectable
class ClientRepository {
  ClientRepository(
    this._firestore,
    this._storageService,
  );

  final FirestoreService _firestore;
  final FirebaseStorageService _storageService;

  static const String _clients = 'clients';
  static const String _attachmentsSubcollection = 'attachments';

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
    required Department department,
    required BusinessSector businessSector,
    required String companyId,
    required String personalId,
    required String email,
    required String phone,
    required ClientStatus status,
    required PriorityLevel priorityLevel,
    required String description,
    List<SocialMediaLink> socialLinks = const [],
    bool hasBeenCalled = false,
  }) async {
    final now = DateTime.now();

    final clientData = {
      'assignedTo': assignedTo,
      'tags': tags,
      'companyName': companyName,
      'name': name,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'department': department.label,
      'businessSector': businessSector.label,
      'companyId': companyId,
      'personalId': personalId,
      'phone': phone,
      'status': status.label,
      'priorityLevel': priorityLevel.label,
      'description': description,
      'socialLinks': socialLinks.map((link) => link.toJson()).toList(),
      'hasBeenCalled': hasBeenCalled,
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
      department: department,
      businessSector: businessSector,
      companyId: companyId,
      personalId: personalId,
      email: email,
      phone: phone,
      status: status,
      priorityLevel: priorityLevel,
      description: description,
      createdAt: now,
      updatedAt: now,
      tagIds: tags.map((tag) => tag.id).toList(),
      socialLinks: socialLinks,
      hasBeenCalled: hasBeenCalled,
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
    required Department department,
    required BusinessSector businessSector,
    required String email,
    required String phone,
    required ClientStatus status,
    required PriorityLevel priorityLevel,
    required String description,
    required DateTime createdAt,
    List<SocialMediaLink> socialLinks = const [],
    bool hasBeenCalled = false,
  }) async {
    final now = DateTime.now();

    final clientData = {
      'companyName': companyName,
      'name': name,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'department': department.label,
      'businessSector': businessSector.label,
      'personalId': personalId,
      'companyId': companyId,
      'email': email,
      'phone': phone,
      'status': status.label,
      'priorityLevel': priorityLevel.label,
      'description': description,
      'socialLinks': socialLinks.map((link) => link.toJson()).toList(),
      'hasBeenCalled': hasBeenCalled,
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
      tags: [], // TODO(HristoPetkov): Update when tags are available
      companyName: companyName,
      name: name,
      dateOfBirth: dateOfBirth,
      department: department,
      businessSector: businessSector,
      personalId: personalId,
      companyId: companyId,
      email: email,
      phone: phone,
      status: status,
      priorityLevel: priorityLevel,
      description: description,
      createdAt: createdAt,
      updatedAt: now,
      assignedToId: assignedTo.id,
      socialLinks: socialLinks,
      hasBeenCalled: hasBeenCalled,
    );

    return updatedClient;
  }

  Future<void> deleteClient(String clientId) async {
    if (clientId.isEmpty) {
      throw ArgumentError('Client ID cannot be empty');
    }

    try {
      final subcollectionRef = _firestore
          .getCollection(_clients)
          .doc(clientId)
          .collection(_attachmentsSubcollection);
      await _firestore.deleteSubcollection(subcollectionRef);
    } catch (e) {
      Log.error('Failed to delete subcollection for client $clientId: $e');
    }

    try {
      final storageFolderPath = '$_attachmentsSubcollection/$clientId';
      await _storageService.deleteFolder(storageFolderPath);
    } catch (e) {
      Log.error('Failed to delete storage for client $clientId: $e');
    }

    await _firestore.deleteCollection(_clients, clientId);
  }
}
