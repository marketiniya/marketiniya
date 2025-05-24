// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialMediaLink _$SocialMediaLinkFromJson(Map<String, dynamic> json) {
  return _SocialMediaLink.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaLink {
  String get platform => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SocialMediaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialMediaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialMediaLinkCopyWith<SocialMediaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaLinkCopyWith<$Res> {
  factory $SocialMediaLinkCopyWith(
          SocialMediaLink value, $Res Function(SocialMediaLink) then) =
      _$SocialMediaLinkCopyWithImpl<$Res, SocialMediaLink>;
  @useResult
  $Res call({String platform, String url});
}

/// @nodoc
class _$SocialMediaLinkCopyWithImpl<$Res, $Val extends SocialMediaLink>
    implements $SocialMediaLinkCopyWith<$Res> {
  _$SocialMediaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialMediaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaLinkImplCopyWith<$Res>
    implements $SocialMediaLinkCopyWith<$Res> {
  factory _$$SocialMediaLinkImplCopyWith(_$SocialMediaLinkImpl value,
          $Res Function(_$SocialMediaLinkImpl) then) =
      __$$SocialMediaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String platform, String url});
}

/// @nodoc
class __$$SocialMediaLinkImplCopyWithImpl<$Res>
    extends _$SocialMediaLinkCopyWithImpl<$Res, _$SocialMediaLinkImpl>
    implements _$$SocialMediaLinkImplCopyWith<$Res> {
  __$$SocialMediaLinkImplCopyWithImpl(
      _$SocialMediaLinkImpl _value, $Res Function(_$SocialMediaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialMediaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? url = null,
  }) {
    return _then(_$SocialMediaLinkImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaLinkImpl implements _SocialMediaLink {
  const _$SocialMediaLinkImpl({required this.platform, required this.url});

  factory _$SocialMediaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialMediaLinkImplFromJson(json);

  @override
  final String platform;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialMediaLink(platform: $platform, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaLinkImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, platform, url);

  /// Create a copy of SocialMediaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaLinkImplCopyWith<_$SocialMediaLinkImpl> get copyWith =>
      __$$SocialMediaLinkImplCopyWithImpl<_$SocialMediaLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaLinkImplToJson(
      this,
    );
  }
}

abstract class _SocialMediaLink implements SocialMediaLink {
  const factory _SocialMediaLink(
      {required final String platform,
      required final String url}) = _$SocialMediaLinkImpl;

  factory _SocialMediaLink.fromJson(Map<String, dynamic> json) =
      _$SocialMediaLinkImpl.fromJson;

  @override
  String get platform;
  @override
  String get url;

  /// Create a copy of SocialMediaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialMediaLinkImplCopyWith<_$SocialMediaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
