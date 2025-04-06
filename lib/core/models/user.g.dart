// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
