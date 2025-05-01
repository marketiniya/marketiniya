// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      assignedTo: const DocumentReferenceConverter()
          .fromJson(json['assignedTo'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => const DocumentReferenceConverter().fromJson(e as String))
          .toList(),
      companyName: json['companyName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      industry: json['industry'] as String,
      personalOrCompanyId: json['personalOrCompanyId'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      assignedToId: json['assignedToId'] as String? ?? '',
      tagIds: (json['tagIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'assignedTo':
          const DocumentReferenceConverter().toJson(instance.assignedTo),
      'tags':
          instance.tags.map(const DocumentReferenceConverter().toJson).toList(),
      'companyName': instance.companyName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'industry': instance.industry,
      'personalOrCompanyId': instance.personalOrCompanyId,
      'phone': instance.phone,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'assignedToId': instance.assignedToId,
      'tagIds': instance.tagIds,
    };
