import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/converters/document_reference_converter.dart';
import 'package:marketinya/core/enums/client_status.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    required String id,
    @DocumentReferenceConverter() required DocumentReference assignedTo,
    @Default('') String assignedToId,
    @DocumentReferenceConverter() required List<DocumentReference> tags,
    @Default([]) List<String> tagIds,
    required String companyName,
    required DateTime dateOfBirth,
    required String industry,
    required String personalOrCompanyId,
    required String phone,
    required ClientStatus status,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  factory Client.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final assignedTo = data['assignedTo'] as DocumentReference;
    final tags = List<DocumentReference>.from(data['tags'] ?? []);

    return Client(
      // Auto-generated document ID, also used as the client's unique id
      id: doc.id,
      assignedTo: assignedTo,
      tags: tags,
      companyName: data['companyName'] as String,
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      industry: data['industry'] as String,
      personalOrCompanyId: data['personalOrCompanyId'] as String,
      phone: data['phone'] as String,
      status: ClientStatus.values.firstWhere(
        (e) => e.label == (data['status'] as String),
        orElse: () => ClientStatus.active,
      ),
      description: data['description'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      assignedToId: assignedTo.id,
      tagIds: tags.map((tag) => tag.id).toList(),
    );
  }
}
