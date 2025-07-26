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
  String get id => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  Department get department => throw _privateConstructorUsedError;
  BusinessSector get businessSector => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  String get personalId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  ClientStatus get status => throw _privateConstructorUsedError;
  PriorityLevel get priorityLevel => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get assignedTo =>
      throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  List<DocumentReference<Object?>> get tags =>
      throw _privateConstructorUsedError;
  String get assignedToId => throw _privateConstructorUsedError;
  List<String> get tagIds => throw _privateConstructorUsedError;
  List<SocialMediaLink> get socialLinks => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  bool get hasBeenCalled => throw _privateConstructorUsedError;

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
      {String id,
      String companyName,
      String name,
      DateTime dateOfBirth,
      Department department,
      BusinessSector businessSector,
      String companyId,
      String personalId,
      String email,
      String phone,
      ClientStatus status,
      PriorityLevel priorityLevel,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter() List<DocumentReference<Object?>> tags,
      String assignedToId,
      List<String> tagIds,
      List<SocialMediaLink> socialLinks,
      bool isDeleted,
      bool hasBeenCalled});
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
    Object? id = null,
    Object? companyName = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? department = null,
    Object? businessSector = null,
    Object? companyId = null,
    Object? personalId = null,
    Object? email = null,
    Object? phone = null,
    Object? status = null,
    Object? priorityLevel = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedTo = null,
    Object? tags = null,
    Object? assignedToId = null,
    Object? tagIds = null,
    Object? socialLinks = null,
    Object? isDeleted = null,
    Object? hasBeenCalled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      businessSector: null == businessSector
          ? _value.businessSector
          : businessSector // ignore: cast_nullable_to_non_nullable
              as BusinessSector,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      personalId: null == personalId
          ? _value.personalId
          : personalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClientStatus,
      priorityLevel: null == priorityLevel
          ? _value.priorityLevel
          : priorityLevel // ignore: cast_nullable_to_non_nullable
              as PriorityLevel,
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
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<DocumentReference<Object?>>,
      assignedToId: null == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as String,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      socialLinks: null == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaLink>,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBeenCalled: null == hasBeenCalled
          ? _value.hasBeenCalled
          : hasBeenCalled // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String id,
      String companyName,
      String name,
      DateTime dateOfBirth,
      Department department,
      BusinessSector businessSector,
      String companyId,
      String personalId,
      String email,
      String phone,
      ClientStatus status,
      PriorityLevel priorityLevel,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter() List<DocumentReference<Object?>> tags,
      String assignedToId,
      List<String> tagIds,
      List<SocialMediaLink> socialLinks,
      bool isDeleted,
      bool hasBeenCalled});
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
    Object? id = null,
    Object? companyName = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? department = null,
    Object? businessSector = null,
    Object? companyId = null,
    Object? personalId = null,
    Object? email = null,
    Object? phone = null,
    Object? status = null,
    Object? priorityLevel = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedTo = null,
    Object? tags = null,
    Object? assignedToId = null,
    Object? tagIds = null,
    Object? socialLinks = null,
    Object? isDeleted = null,
    Object? hasBeenCalled = null,
  }) {
    return _then(_$ClientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      businessSector: null == businessSector
          ? _value.businessSector
          : businessSector // ignore: cast_nullable_to_non_nullable
              as BusinessSector,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      personalId: null == personalId
          ? _value.personalId
          : personalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ClientStatus,
      priorityLevel: null == priorityLevel
          ? _value.priorityLevel
          : priorityLevel // ignore: cast_nullable_to_non_nullable
              as PriorityLevel,
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
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<DocumentReference<Object?>>,
      assignedToId: null == assignedToId
          ? _value.assignedToId
          : assignedToId // ignore: cast_nullable_to_non_nullable
              as String,
      tagIds: null == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      socialLinks: null == socialLinks
          ? _value._socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaLink>,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBeenCalled: null == hasBeenCalled
          ? _value.hasBeenCalled
          : hasBeenCalled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl(
      {required this.id,
      required this.companyName,
      required this.name,
      required this.dateOfBirth,
      required this.department,
      required this.businessSector,
      required this.companyId,
      required this.personalId,
      required this.email,
      required this.phone,
      required this.status,
      required this.priorityLevel,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      @DocumentReferenceConverter() required this.assignedTo,
      @DocumentReferenceConverter()
      required final List<DocumentReference<Object?>> tags,
      this.assignedToId = '',
      final List<String> tagIds = const [],
      final List<SocialMediaLink> socialLinks = const [],
      this.isDeleted = false,
      this.hasBeenCalled = false})
      : _tags = tags,
        _tagIds = tagIds,
        _socialLinks = socialLinks;

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  final String id;
  @override
  final String companyName;
  @override
  final String name;
  @override
  final DateTime dateOfBirth;
  @override
  final Department department;
  @override
  final BusinessSector businessSector;
  @override
  final String companyId;
  @override
  final String personalId;
  @override
  final String email;
  @override
  final String phone;
  @override
  final ClientStatus status;
  @override
  final PriorityLevel priorityLevel;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
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

  final List<SocialMediaLink> _socialLinks;
  @override
  @JsonKey()
  List<SocialMediaLink> get socialLinks {
    if (_socialLinks is EqualUnmodifiableListView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialLinks);
  }

  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final bool hasBeenCalled;

  @override
  String toString() {
    return 'Client(id: $id, companyName: $companyName, name: $name, dateOfBirth: $dateOfBirth, department: $department, businessSector: $businessSector, companyId: $companyId, personalId: $personalId, email: $email, phone: $phone, status: $status, priorityLevel: $priorityLevel, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, assignedTo: $assignedTo, tags: $tags, assignedToId: $assignedToId, tagIds: $tagIds, socialLinks: $socialLinks, isDeleted: $isDeleted, hasBeenCalled: $hasBeenCalled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.businessSector, businessSector) ||
                other.businessSector == businessSector) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.personalId, personalId) ||
                other.personalId == personalId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priorityLevel, priorityLevel) ||
                other.priorityLevel == priorityLevel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.assignedToId, assignedToId) ||
                other.assignedToId == assignedToId) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds) &&
            const DeepCollectionEquality()
                .equals(other._socialLinks, _socialLinks) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.hasBeenCalled, hasBeenCalled) ||
                other.hasBeenCalled == hasBeenCalled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyName,
        name,
        dateOfBirth,
        department,
        businessSector,
        companyId,
        personalId,
        email,
        phone,
        status,
        priorityLevel,
        description,
        createdAt,
        updatedAt,
        assignedTo,
        const DeepCollectionEquality().hash(_tags),
        assignedToId,
        const DeepCollectionEquality().hash(_tagIds),
        const DeepCollectionEquality().hash(_socialLinks),
        isDeleted,
        hasBeenCalled
      ]);

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
      {required final String id,
      required final String companyName,
      required final String name,
      required final DateTime dateOfBirth,
      required final Department department,
      required final BusinessSector businessSector,
      required final String companyId,
      required final String personalId,
      required final String email,
      required final String phone,
      required final ClientStatus status,
      required final PriorityLevel priorityLevel,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      @DocumentReferenceConverter()
      required final DocumentReference<Object?> assignedTo,
      @DocumentReferenceConverter()
      required final List<DocumentReference<Object?>> tags,
      final String assignedToId,
      final List<String> tagIds,
      final List<SocialMediaLink> socialLinks,
      final bool isDeleted,
      final bool hasBeenCalled}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  String get id;
  @override
  String get companyName;
  @override
  String get name;
  @override
  DateTime get dateOfBirth;
  @override
  Department get department;
  @override
  BusinessSector get businessSector;
  @override
  String get companyId;
  @override
  String get personalId;
  @override
  String get email;
  @override
  String get phone;
  @override
  ClientStatus get status;
  @override
  PriorityLevel get priorityLevel;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get assignedTo;
  @override
  @DocumentReferenceConverter()
  List<DocumentReference<Object?>> get tags;
  @override
  String get assignedToId;
  @override
  List<String> get tagIds;
  @override
  List<SocialMediaLink> get socialLinks;
  @override
  bool get isDeleted;
  @override
  bool get hasBeenCalled;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
