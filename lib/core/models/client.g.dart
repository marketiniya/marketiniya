// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      id: json['id'] as String,
      assignedTo: const DocumentReferenceConverter()
          .fromJson(json['assignedTo'] as String),
      assignedToId: json['assignedToId'] as String? ?? '',
      tags: (json['tags'] as List<dynamic>)
          .map((e) => const DocumentReferenceConverter().fromJson(e as String))
          .toList(),
      tagIds: (json['tagIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      companyName: json['companyName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      industry: json['industry'] as String,
      personalOrCompanyId: json['personalOrCompanyId'] as String,
      phone: json['phone'] as String,
      status: $enumDecode(_$ClientStatusEnumMap, json['status']),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assignedTo':
          const DocumentReferenceConverter().toJson(instance.assignedTo),
      'assignedToId': instance.assignedToId,
      'tags':
          instance.tags.map(const DocumentReferenceConverter().toJson).toList(),
      'tagIds': instance.tagIds,
      'companyName': instance.companyName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'industry': instance.industry,
      'personalOrCompanyId': instance.personalOrCompanyId,
      'phone': instance.phone,
      'status': _$ClientStatusEnumMap[instance.status]!,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ClientStatusEnumMap = {
  ClientStatus.active: 'active',
  ClientStatus.inactive: 'inactive',
};
