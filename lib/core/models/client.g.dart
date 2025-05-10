// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      businessSector:
          $enumDecode(_$BusinessSectorEnumMap, json['businessSector']),
      companyId: json['companyId'] as String,
      personalId: json['personalId'] as String,
      phone: json['phone'] as String,
      status: $enumDecode(_$ClientStatusEnumMap, json['status']),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      assignedTo: const DocumentReferenceConverter()
          .fromJson(json['assignedTo'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => const DocumentReferenceConverter().fromJson(e as String))
          .toList(),
      assignedToId: json['assignedToId'] as String? ?? '',
      tagIds: (json['tagIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'businessSector': _$BusinessSectorEnumMap[instance.businessSector]!,
      'companyId': instance.companyId,
      'personalId': instance.personalId,
      'phone': instance.phone,
      'status': _$ClientStatusEnumMap[instance.status]!,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'assignedTo':
          const DocumentReferenceConverter().toJson(instance.assignedTo),
      'tags':
          instance.tags.map(const DocumentReferenceConverter().toJson).toList(),
      'assignedToId': instance.assignedToId,
      'tagIds': instance.tagIds,
    };

const _$BusinessSectorEnumMap = {
  BusinessSector.onlineStores: 'onlineStores',
  BusinessSector.restaurants: 'restaurants',
  BusinessSector.hotels: 'hotels',
  BusinessSector.beautySalons: 'beautySalons',
  BusinessSector.groceryStores: 'groceryStores',
  BusinessSector.wineries: 'wineries',
  BusinessSector.lawFirms: 'lawFirms',
  BusinessSector.accountingFirms: 'accountingFirms',
  BusinessSector.serviceBusinesses: 'serviceBusinesses',
  BusinessSector.fastFood: 'fastFood',
  BusinessSector.tattoos: 'tattoos',
  BusinessSector.other: 'other',
  BusinessSector.unknown: 'unknown',
};

const _$ClientStatusEnumMap = {
  ClientStatus.active: 'active',
  ClientStatus.inactive: 'inactive',
};
