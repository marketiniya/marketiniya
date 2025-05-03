// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  @DocumentReferenceConverter()
  DocumentReference<Object?> get assignedTo =>
      throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  List<DocumentReference<Object?>> get tags =>
      throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get industry => throw _privateConstructorUsedError;
  String get personalOrCompanyId => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  ClientStatus get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get assignedToId => throw _privateConstructorUsedError;
  List<String> get tagIds => throw _privateConstructorUsedError;

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call(
      {@DocumentReferenceConverter() DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter() List<DocumentReference<Object?>> tags,
      String companyName,
      DateTime dateOfBirth,
      String industry,
      String personalOrCompanyId,
      String phone,
      ClientStatus status,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String assignedToId,
      List<String> tagIds});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedTo = null,
    Object? tags = null,
    Object? companyName = null,
    Object? dateOfBirth = null,
    Object? industry = null,
    Object? personalOrCompanyId = null,
    Object? phone = null,
    Object? status = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedToId = null,
    Object? tagIds = null,
  }) {
    return _then(_value.copyWith(
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<DocumentReference<Object?>>,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      personalOrCompanyId: null == personalOrCompanyId
          ? _value.personalOrCompanyId
          : personalOrCompanyId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClientStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedToId: null == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as String,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientImplCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$ClientImplCopyWith(
          _$ClientImpl value, $Res Function(_$ClientImpl) then) =
      __$$ClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DocumentReferenceConverter() DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter() List<DocumentReference<Object?>> tags,
      String companyName,
      DateTime dateOfBirth,
      String industry,
      String personalOrCompanyId,
      String phone,
      ClientStatus status,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String assignedToId,
      List<String> tagIds});
}

/// @nodoc
class __$$ClientImplCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$ClientImpl>
    implements _$$ClientImplCopyWith<$Res> {
  __$$ClientImplCopyWithImpl(
      _$ClientImpl _value, $Res Function(_$ClientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedTo = null,
    Object? tags = null,
    Object? companyName = null,
    Object? dateOfBirth = null,
    Object? industry = null,
    Object? personalOrCompanyId = null,
    Object? phone = null,
    Object? status = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedToId = null,
    Object? tagIds = null,
  }) {
    return _then(_$ClientImpl(
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<DocumentReference<Object?>>,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      personalOrCompanyId: null == personalOrCompanyId
          ? _value.personalOrCompanyId
          : personalOrCompanyId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClientStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedToId: null == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as String,
      tagIds: null == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl(
      {@DocumentReferenceConverter() required this.assignedTo,
      @DocumentReferenceConverter()
      required final List<DocumentReference<Object?>> tags,
      required this.companyName,
      required this.dateOfBirth,
      required this.industry,
      required this.personalOrCompanyId,
      required this.phone,
      required this.status,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      this.assignedToId = '',
      final List<String> tagIds = const []})
      : _tags = tags,
        _tagIds = tagIds;

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> assignedTo;
  final List<DocumentReference<Object?>> _tags;
  @override
  @DocumentReferenceConverter()
  List<DocumentReference<Object?>> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String companyName;
  @override
  final DateTime dateOfBirth;
  @override
  final String industry;
  @override
  final String personalOrCompanyId;
  @override
  final String phone;
  @override
  final ClientStatus status;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String assignedToId;
  final List<String> _tagIds;
  @override
  @JsonKey()
  List<String> get tagIds {
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'Client(assignedTo: $assignedTo, tags: $tags, companyName: $companyName, dateOfBirth: $dateOfBirth, industry: $industry, personalOrCompanyId: $personalOrCompanyId, phone: $phone, status: $status, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, assignedToId: $assignedToId, tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.personalOrCompanyId, personalOrCompanyId) ||
                other.personalOrCompanyId == personalOrCompanyId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assignedToId, assignedToId) ||
                other.assignedToId == assignedToId) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assignedTo,
      const DeepCollectionEquality().hash(_tags),
      companyName,
      dateOfBirth,
      industry,
      personalOrCompanyId,
      phone,
      status,
      description,
      createdAt,
      updatedAt,
      assignedToId,
      const DeepCollectionEquality().hash(_tagIds));

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      __$$ClientImplCopyWithImpl<_$ClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientImplToJson(
      this,
    );
  }
}

abstract class _Client implements Client {
  const factory _Client(
      {@DocumentReferenceConverter()
      required final DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter()
      required final List<DocumentReference<Object?>> tags,
      required final String companyName,
      required final DateTime dateOfBirth,
      required final String industry,
      required final String personalOrCompanyId,
      required final String phone,
      required final ClientStatus status,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String assignedToId,
      final List<String> tagIds}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get assignedTo;
  @override
  @DocumentReferenceConverter()
  List<DocumentReference<Object?>> get tags;
  @override
  String get companyName;
  @override
  DateTime get dateOfBirth;
  @override
  String get industry;
  @override
  String get personalOrCompanyId;
  @override
  String get phone;
  @override
  ClientStatus get status;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get assignedToId;
  @override
  List<String> get tagIds;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
