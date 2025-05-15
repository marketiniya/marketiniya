import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/converters/document_reference_converter.dart';
import 'package:marketinya/core/enums/business_sector.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:marketinya/core/enums/priority_level.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    required String id,
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
    required DateTime createdAt,
    required DateTime updatedAt,
    @DocumentReferenceConverter() required DocumentReference assignedTo,
    @DocumentReferenceConverter() required List<DocumentReference> tags,
    @Default('') String assignedToId,
    @Default([]) List<String> tagIds,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  factory Client.fromFirestore(DocumentSnapshot doc) {
    final rawData = doc.data();

    if (rawData == null) {
      throw Exception('Document data is null');
    }

    final data = rawData as Map<String, dynamic>;
    final assignedTo = data['assignedTo'] as DocumentReference;
    final tags = List<DocumentReference>.from((data['tags'] as Iterable?) ?? []);

    return Client(
      // Auto-generated document ID, also used as the client's unique id
      id: doc.id,
      assignedTo: assignedTo,
      tags: tags,
      companyName: data['companyName'] as String,
      name: data['name'] as String,
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      businessSector: BusinessSector.values.firstWhere(
        (e) => e.label == (data['businessSector'] as String),
        orElse: () => BusinessSector.other,
      ),
      personalId: data['personalId'] as String,
      companyId: data['companyId'] as String,
      phone: data['phone'] as String,
      status: ClientStatus.values.firstWhere(
        (e) => e.label == (data['status'] as String),
        orElse: () => ClientStatus.active,
      ),
      priorityLevel: PriorityLevel.values.firstWhere(
        (e) => e.label == (data['priorityLevel'] as String),
        orElse: () => PriorityLevel.lowPriority,
      ),
      description: data['description'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      assignedToId: assignedTo.id,
      tagIds: tags.map((tag) => tag.id).toList(),
    );
  }
}
