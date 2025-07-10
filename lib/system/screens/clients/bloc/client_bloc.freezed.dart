// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClientEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientEventCopyWith<$Res> {
  factory $ClientEventCopyWith(
          ClientEvent value, $Res Function(ClientEvent) then) =
      _$ClientEventCopyWithImpl<$Res, ClientEvent>;
}

/// @nodoc
class _$ClientEventCopyWithImpl<$Res, $Val extends ClientEvent>
    implements $ClientEventCopyWith<$Res> {
  _$ClientEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnLoadImplCopyWith<$Res> {
  factory _$$OnLoadImplCopyWith(
          _$OnLoadImpl value, $Res Function(_$OnLoadImpl) then) =
      __$$OnLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadImplCopyWithImpl<$Res>
    extends _$ClientEventCopyWithImpl<$Res, _$OnLoadImpl>
    implements _$$OnLoadImplCopyWith<$Res> {
  __$$OnLoadImplCopyWithImpl(
      _$OnLoadImpl _value, $Res Function(_$OnLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnLoadImpl implements _OnLoad {
  const _$OnLoadImpl();

  @override
  String toString() {
    return 'ClientEvent.onLoad()';
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
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) {
    return onLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) {
    return onLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
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
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) {
    return onLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) {
    return onLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad(this);
    }
    return orElse();
  }
}

abstract class _OnLoad implements ClientEvent {
  const factory _OnLoad() = _$OnLoadImpl;
}

/// @nodoc
abstract class _$$OnClientUpdatedImplCopyWith<$Res> {
  factory _$$OnClientUpdatedImplCopyWith(_$OnClientUpdatedImpl value,
          $Res Function(_$OnClientUpdatedImpl) then) =
      __$$OnClientUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Client client});

  $ClientCopyWith<$Res> get client;
}

/// @nodoc
class __$$OnClientUpdatedImplCopyWithImpl<$Res>
    extends _$ClientEventCopyWithImpl<$Res, _$OnClientUpdatedImpl>
    implements _$$OnClientUpdatedImplCopyWith<$Res> {
  __$$OnClientUpdatedImplCopyWithImpl(
      _$OnClientUpdatedImpl _value, $Res Function(_$OnClientUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
  }) {
    return _then(_$OnClientUpdatedImpl(
      null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
    ));
  }

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res> get client {
    return $ClientCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }
}

/// @nodoc

class _$OnClientUpdatedImpl implements _OnClientUpdated {
  const _$OnClientUpdatedImpl(this.client);

  @override
  final Client client;

  @override
  String toString() {
    return 'ClientEvent.onClientUpdated(client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnClientUpdatedImpl &&
            (identical(other.client, client) || other.client == client));
  }

  @override
  int get hashCode => Object.hash(runtimeType, client);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnClientUpdatedImplCopyWith<_$OnClientUpdatedImpl> get copyWith =>
      __$$OnClientUpdatedImplCopyWithImpl<_$OnClientUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) {
    return onClientUpdated(client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) {
    return onClientUpdated?.call(client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onClientUpdated != null) {
      return onClientUpdated(client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) {
    return onClientUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) {
    return onClientUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onClientUpdated != null) {
      return onClientUpdated(this);
    }
    return orElse();
  }
}

abstract class _OnClientUpdated implements ClientEvent {
  const factory _OnClientUpdated(final Client client) = _$OnClientUpdatedImpl;

  Client get client;

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnClientUpdatedImplCopyWith<_$OnClientUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSearchImplCopyWith<$Res> {
  factory _$$OnSearchImplCopyWith(
          _$OnSearchImpl value, $Res Function(_$OnSearchImpl) then) =
      __$$OnSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$OnSearchImplCopyWithImpl<$Res>
    extends _$ClientEventCopyWithImpl<$Res, _$OnSearchImpl>
    implements _$$OnSearchImplCopyWith<$Res> {
  __$$OnSearchImplCopyWithImpl(
      _$OnSearchImpl _value, $Res Function(_$OnSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$OnSearchImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSearchImpl implements _OnSearch {
  const _$OnSearchImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ClientEvent.onSearch(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchImplCopyWith<_$OnSearchImpl> get copyWith =>
      __$$OnSearchImplCopyWithImpl<_$OnSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) {
    return onSearch(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) {
    return onSearch?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) {
    return onSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) {
    return onSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(this);
    }
    return orElse();
  }
}

abstract class _OnSearch implements ClientEvent {
  const factory _OnSearch(final String query) = _$OnSearchImpl;

  String get query;

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSearchImplCopyWith<_$OnSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPageChangedImplCopyWith<$Res> {
  factory _$$OnPageChangedImplCopyWith(
          _$OnPageChangedImpl value, $Res Function(_$OnPageChangedImpl) then) =
      __$$OnPageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$OnPageChangedImplCopyWithImpl<$Res>
    extends _$ClientEventCopyWithImpl<$Res, _$OnPageChangedImpl>
    implements _$$OnPageChangedImplCopyWith<$Res> {
  __$$OnPageChangedImplCopyWithImpl(
      _$OnPageChangedImpl _value, $Res Function(_$OnPageChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$OnPageChangedImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnPageChangedImpl implements _OnPageChanged {
  const _$OnPageChangedImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'ClientEvent.onPageChanged(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPageChangedImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPageChangedImplCopyWith<_$OnPageChangedImpl> get copyWith =>
      __$$OnPageChangedImplCopyWithImpl<_$OnPageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) {
    return onPageChanged(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) {
    return onPageChanged?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onPageChanged != null) {
      return onPageChanged(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) {
    return onPageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) {
    return onPageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onPageChanged != null) {
      return onPageChanged(this);
    }
    return orElse();
  }
}

abstract class _OnPageChanged implements ClientEvent {
  const factory _OnPageChanged(final int page) = _$OnPageChangedImpl;

  int get page;

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnPageChangedImplCopyWith<_$OnPageChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnItemsPerPageChangedImplCopyWith<$Res> {
  factory _$$OnItemsPerPageChangedImplCopyWith(
          _$OnItemsPerPageChangedImpl value,
          $Res Function(_$OnItemsPerPageChangedImpl) then) =
      __$$OnItemsPerPageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemsPerPage});
}

/// @nodoc
class __$$OnItemsPerPageChangedImplCopyWithImpl<$Res>
    extends _$ClientEventCopyWithImpl<$Res, _$OnItemsPerPageChangedImpl>
    implements _$$OnItemsPerPageChangedImplCopyWith<$Res> {
  __$$OnItemsPerPageChangedImplCopyWithImpl(_$OnItemsPerPageChangedImpl _value,
      $Res Function(_$OnItemsPerPageChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemsPerPage = null,
  }) {
    return _then(_$OnItemsPerPageChangedImpl(
      null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnItemsPerPageChangedImpl implements _OnItemsPerPageChanged {
  const _$OnItemsPerPageChangedImpl(this.itemsPerPage);

  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'ClientEvent.onItemsPerPageChanged(itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnItemsPerPageChangedImpl &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemsPerPage);

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnItemsPerPageChangedImplCopyWith<_$OnItemsPerPageChangedImpl>
      get copyWith => __$$OnItemsPerPageChangedImplCopyWithImpl<
          _$OnItemsPerPageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoad,
    required TResult Function(Client client) onClientUpdated,
    required TResult Function(String query) onSearch,
    required TResult Function(int page) onPageChanged,
    required TResult Function(int itemsPerPage) onItemsPerPageChanged,
  }) {
    return onItemsPerPageChanged(itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoad,
    TResult? Function(Client client)? onClientUpdated,
    TResult? Function(String query)? onSearch,
    TResult? Function(int page)? onPageChanged,
    TResult? Function(int itemsPerPage)? onItemsPerPageChanged,
  }) {
    return onItemsPerPageChanged?.call(itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoad,
    TResult Function(Client client)? onClientUpdated,
    TResult Function(String query)? onSearch,
    TResult Function(int page)? onPageChanged,
    TResult Function(int itemsPerPage)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onItemsPerPageChanged != null) {
      return onItemsPerPageChanged(itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_OnClientUpdated value) onClientUpdated,
    required TResult Function(_OnSearch value) onSearch,
    required TResult Function(_OnPageChanged value) onPageChanged,
    required TResult Function(_OnItemsPerPageChanged value)
        onItemsPerPageChanged,
  }) {
    return onItemsPerPageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnLoad value)? onLoad,
    TResult? Function(_OnClientUpdated value)? onClientUpdated,
    TResult? Function(_OnSearch value)? onSearch,
    TResult? Function(_OnPageChanged value)? onPageChanged,
    TResult? Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
  }) {
    return onItemsPerPageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_OnClientUpdated value)? onClientUpdated,
    TResult Function(_OnSearch value)? onSearch,
    TResult Function(_OnPageChanged value)? onPageChanged,
    TResult Function(_OnItemsPerPageChanged value)? onItemsPerPageChanged,
    required TResult orElse(),
  }) {
    if (onItemsPerPageChanged != null) {
      return onItemsPerPageChanged(this);
    }
    return orElse();
  }
}

abstract class _OnItemsPerPageChanged implements ClientEvent {
  const factory _OnItemsPerPageChanged(final int itemsPerPage) =
      _$OnItemsPerPageChangedImpl;

  int get itemsPerPage;

  /// Create a copy of ClientEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnItemsPerPageChangedImplCopyWith<_$OnItemsPerPageChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
