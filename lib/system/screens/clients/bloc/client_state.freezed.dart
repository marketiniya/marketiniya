// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClientState {
  Status get status => throw _privateConstructorUsedError;
  List<Client> get clients => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ClientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res, ClientState>;
  @useResult
  $Res call(
      {Status status,
      List<Client> clients,
      String searchQuery,
      int currentPage,
      int itemsPerPage,
      String? errorMessage});
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res, $Val extends ClientState>
    implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? clients = null,
    Object? searchQuery = null,
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientStateImplCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$$ClientStateImplCopyWith(
          _$ClientStateImpl value, $Res Function(_$ClientStateImpl) then) =
      __$$ClientStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<Client> clients,
      String searchQuery,
      int currentPage,
      int itemsPerPage,
      String? errorMessage});
}

/// @nodoc
class __$$ClientStateImplCopyWithImpl<$Res>
    extends _$ClientStateCopyWithImpl<$Res, _$ClientStateImpl>
    implements _$$ClientStateImplCopyWith<$Res> {
  __$$ClientStateImplCopyWithImpl(
      _$ClientStateImpl _value, $Res Function(_$ClientStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? clients = null,
    Object? searchQuery = null,
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ClientStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      clients: null == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClientStateImpl implements _ClientState {
  const _$ClientStateImpl(
      {this.status = Status.initial,
      final List<Client> clients = const [],
      this.searchQuery = '',
      this.currentPage = 1,
      this.itemsPerPage = 15,
      this.errorMessage})
      : _clients = clients;

  @override
  @JsonKey()
  final Status status;
  final List<Client> _clients;
  @override
  @JsonKey()
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int itemsPerPage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ClientState(status: $status, clients: $clients, searchQuery: $searchQuery, currentPage: $currentPage, itemsPerPage: $itemsPerPage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_clients),
      searchQuery,
      currentPage,
      itemsPerPage,
      errorMessage);

  /// Create a copy of ClientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      __$$ClientStateImplCopyWithImpl<_$ClientStateImpl>(this, _$identity);
}

abstract class _ClientState implements ClientState {
  const factory _ClientState(
      {final Status status,
      final List<Client> clients,
      final String searchQuery,
      final int currentPage,
      final int itemsPerPage,
      final String? errorMessage}) = _$ClientStateImpl;

  @override
  Status get status;
  @override
  List<Client> get clients;
  @override
  String get searchQuery;
  @override
  int get currentPage;
  @override
  int get itemsPerPage;
  @override
  String? get errorMessage;

  /// Create a copy of ClientState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
