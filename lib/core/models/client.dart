import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/converters/document_reference_converter.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    @DocumentReferenceConverter() required DocumentReference assignedTo,
    @DocumentReferenceConverter() required List<DocumentReference> tags,
    required String companyName,
    required DateTime dateOfBirth,
    required String industry,
    required String personalOrCompanyId,
    required String phone,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  factory Client.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Client(
      assignedTo: data['assignedTo'] as DocumentReference,
      tags: List<DocumentReference>.from(data['tags'] ?? []),
      companyName: data['companyName'] as String,
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      industry: data['industry'] as String,
      personalOrCompanyId: data['personalOrCompanyId'] as String,
      phone: data['phone'] as String,
      status: data['status'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
}
