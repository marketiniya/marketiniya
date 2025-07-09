// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onEmailChanged,
    required TResult Function(String password) onPasswordChanged,
    required TResult Function() onSubmitted,
    required TResult Function() onLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onEmailChanged,
    TResult? Function(String password)? onPasswordChanged,
    TResult? Function()? onSubmitted,
    TResult? Function()? onLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onEmailChanged,
    TResult Function(String password)? onPasswordChanged,
    TResult Function()? onSubmitted,
    TResult Function()? onLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_OnPasswordChanged value) onPasswordChanged,
    required TResult Function(_OnSubmitted value) onSubmitted,
    required TResult Function(_OnLoad value) onLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_OnSubmitted value)? onSubmitted,
    TResult? Function(_OnLoad value)? onLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult Function(_OnSubmitted value)? onSubmitted,
    TResult Function(_OnLoad value)? onLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnEmailChangedImplCopyWith<$Res> {
  factory _$$OnEmailChangedImplCopyWith(_$OnEmailChangedImpl value,
          $Res Function(_$OnEmailChangedImpl) then) =
      __$$OnEmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$OnEmailChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnEmailChangedImpl>
    implements _$$OnEmailChangedImplCopyWith<$Res> {
  __$$OnEmailChangedImplCopyWithImpl(
      _$OnEmailChangedImpl _value, $Res Function(_$OnEmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$OnEmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnEmailChangedImpl implements _OnEmailChanged {
  const _$OnEmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.onEmailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEmailChangedImplCopyWith<_$OnEmailChangedImpl> get copyWith =>
      __$$OnEmailChangedImplCopyWithImpl<_$OnEmailChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onEmailChanged,
    required TResult Function(String password) onPasswordChanged,
    required TResult Function() onSubmitted,
    required TResult Function() onLoad,
  }) {
    return onEmailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onEmailChanged,
    TResult? Function(String password)? onPasswordChanged,
    TResult? Function()? onSubmitted,
    TResult? Function()? onLoad,
  }) {
    return onEmailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onEmailChanged,
    TResult Function(String password)? onPasswordChanged,
    TResult Function()? onSubmitted,
    TResult Function()? onLoad,
    required TResult orElse(),
  }) {
    if (onEmailChanged != null) {
      return onEmailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_OnPasswordChanged value) onPasswordChanged,
    required TResult Function(_OnSubmitted value) onSubmitted,
    required TResult Function(_OnLoad value) onLoad,
  }) {
    return onEmailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_OnSubmitted value)? onSubmitted,
    TResult? Function(_OnLoad value)? onLoad,
  }) {
    return onEmailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult Function(_OnSubmitted value)? onSubmitted,
    TResult Function(_OnLoad value)? onLoad,
    required TResult orElse(),
  }) {
    if (onEmailChanged != null) {
      return onEmailChanged(this);
    }
    return orElse();
  }
}

abstract class _OnEmailChanged implements LoginEvent {
  const factory _OnEmailChanged(final String email) = _$OnEmailChangedImpl;

  String get email;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnEmailChangedImplCopyWith<_$OnEmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPasswordChangedImplCopyWith<$Res> {
  factory _$$OnPasswordChangedImplCopyWith(_$OnPasswordChangedImpl value,
          $Res Function(_$OnPasswordChangedImpl) then) =
      __$$OnPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$OnPasswordChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnPasswordChangedImpl>
    implements _$$OnPasswordChangedImplCopyWith<$Res> {
  __$$OnPasswordChangedImplCopyWithImpl(_$OnPasswordChangedImpl _value,
      $Res Function(_$OnPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$OnPasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnPasswordChangedImpl implements _OnPasswordChanged {
  const _$OnPasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.onPasswordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPasswordChangedImplCopyWith<_$OnPasswordChangedImpl> get copyWith =>
      __$$OnPasswordChangedImplCopyWithImpl<_$OnPasswordChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onEmailChanged,
    required TResult Function(String password) onPasswordChanged,
    required TResult Function() onSubmitted,
    required TResult Function() onLoad,
  }) {
    return onPasswordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onEmailChanged,
    TResult? Function(String password)? onPasswordChanged,
    TResult? Function()? onSubmitted,
    TResult? Function()? onLoad,
  }) {
    return onPasswordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onEmailChanged,
    TResult Function(String password)? onPasswordChanged,
    TResult Function()? onSubmitted,
    TResult Function()? onLoad,
    required TResult orElse(),
  }) {
    if (onPasswordChanged != null) {
      return onPasswordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_OnPasswordChanged value) onPasswordChanged,
    required TResult Function(_OnSubmitted value) onSubmitted,
    required TResult Function(_OnLoad value) onLoad,
  }) {
    return onPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_OnSubmitted value)? onSubmitted,
    TResult? Function(_OnLoad value)? onLoad,
  }) {
    return onPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult Function(_OnSubmitted value)? onSubmitted,
    TResult Function(_OnLoad value)? onLoad,
    required TResult orElse(),
  }) {
    if (onPasswordChanged != null) {
      return onPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _OnPasswordChanged implements LoginEvent {
  const factory _OnPasswordChanged(final String password) =
      _$OnPasswordChangedImpl;

  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnPasswordChangedImplCopyWith<_$OnPasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSubmittedImplCopyWith<$Res> {
  factory _$$OnSubmittedImplCopyWith(
          _$OnSubmittedImpl value, $Res Function(_$OnSubmittedImpl) then) =
      __$$OnSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSubmittedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnSubmittedImpl>
    implements _$$OnSubmittedImplCopyWith<$Res> {
  __$$OnSubmittedImplCopyWithImpl(
      _$OnSubmittedImpl _value, $Res Function(_$OnSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnSubmittedImpl implements _OnSubmitted {
  const _$OnSubmittedImpl();

  @override
  String toString() {
    return 'LoginEvent.onSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onEmailChanged,
    required TResult Function(String password) onPasswordChanged,
    required TResult Function() onSubmitted,
    required TResult Function() onLoad,
  }) {
    return onSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onEmailChanged,
    TResult? Function(String password)? onPasswordChanged,
    TResult? Function()? onSubmitted,
    TResult? Function()? onLoad,
  }) {
    return onSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onEmailChanged,
    TResult Function(String password)? onPasswordChanged,
    TResult Function()? onSubmitted,
    TResult Function()? onLoad,
    required TResult orElse(),
  }) {
    if (onSubmitted != null) {
      return onSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_OnPasswordChanged value) onPasswordChanged,
    required TResult Function(_OnSubmitted value) onSubmitted,
    required TResult Function(_OnLoad value) onLoad,
  }) {
    return onSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_OnSubmitted value)? onSubmitted,
    TResult? Function(_OnLoad value)? onLoad,
  }) {
    return onSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult Function(_OnSubmitted value)? onSubmitted,
    TResult Function(_OnLoad value)? onLoad,
    required TResult orElse(),
  }) {
    if (onSubmitted != null) {
      return onSubmitted(this);
    }
    return orElse();
  }
}

abstract class _OnSubmitted implements LoginEvent {
  const factory _OnSubmitted() = _$OnSubmittedImpl;
}

/// @nodoc
abstract class _$$OnLoadImplCopyWith<$Res> {
  factory _$$OnLoadImplCopyWith(
          _$OnLoadImpl value, $Res Function(_$OnLoadImpl) then) =
      __$$OnLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnLoadImpl>
    implements _$$OnLoadImplCopyWith<$Res> {
  __$$OnLoadImplCopyWithImpl(
      _$OnLoadImpl _value, $Res Function(_$OnLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnLoadImpl implements _OnLoad {
  const _$OnLoadImpl();

  @override
  String toString() {
    return 'LoginEvent.onLoad()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onEmailChanged,
    required TResult Function(String password) onPasswordChanged,
    required TResult Function() onSubmitted,
    required TResult Function() onLoad,
  }) {
    return onLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onEmailChanged,
    TResult? Function(String password)? onPasswordChanged,
    TResult? Function()? onSubmitted,
    TResult? Function()? onLoad,
  }) {
    return onLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onEmailChanged,
    TResult Function(String password)? onPasswordChanged,
    TResult Function()? onSubmitted,
    TResult Function()? onLoad,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_OnPasswordChanged value) onPasswordChanged,
    required TResult Function(_OnSubmitted value) onSubmitted,
    required TResult Function(_OnLoad value) onLoad,
  }) {
    return onLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_OnSubmitted value)? onSubmitted,
    TResult? Function(_OnLoad value)? onLoad,
  }) {
    return onLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_OnPasswordChanged value)? onPasswordChanged,
    TResult Function(_OnSubmitted value)? onSubmitted,
    TResult Function(_OnLoad value)? onLoad,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad(this);
    }
    return orElse();
  }
}

abstract class _OnLoad implements LoginEvent {
  const factory _OnLoad() = _$OnLoadImpl;
}

/// @nodoc
mixin _$LoginState {
  Status get status => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {Status status,
      String email,
      String password,
      String? errorMessage,
      String appVersion});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? errorMessage = freezed,
    Object? appVersion = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String email,
      String password,
      String? errorMessage,
      String appVersion});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? errorMessage = freezed,
    Object? appVersion = null,
  }) {
    return _then(_$LoginStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.status = Status.initial,
      this.email = '',
      this.password = '',
      this.errorMessage,
      this.appVersion = ''});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String appVersion;

  @override
  String toString() {
    return 'LoginState(status: $status, email: $email, password: $password, errorMessage: $errorMessage, appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, email, password, errorMessage, appVersion);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final Status status,
      final String email,
      final String password,
      final String? errorMessage,
      final String appVersion}) = _$LoginStateImpl;

  @override
  Status get status;
  @override
  String get email;
  @override
  String get password;
  @override
  String? get errorMessage;
  @override
  String get appVersion;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
