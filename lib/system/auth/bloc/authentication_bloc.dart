import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/models/user.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_state.dart';

part 'authentication_event.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<OnRefresh>(_onRefresh);
    on<OnLogout>(_onLogout);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<Authentication> _authenticationStatusSubscription;
  final UserRepository _userRepository;

  void _onRefresh(OnRefresh event, Emitter<AuthenticationState> emit) {
    final sharedPreferences = getIt<SharedPreferences>();
    final userJsonString = sharedPreferences.getString('currentUser');

    if (userJsonString != null) {
      final userMap = jsonDecode(userJsonString) as Map<String, dynamic>;
      final currentUserFromCache = User.fromJson(userMap);
      emit(state.copyWith(user: currentUserFromCache));
    }
  }

  Future<void> _onLogout(
    OnLogout event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authenticationRepository.logout();
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case Authentication.authenticated:
        await _handleAuthenticated(emit);
        break;
      case Authentication.unauthenticated:
        emit(AuthenticationState.unauthenticated());
        break;
      case Authentication.unknown:
        emit(AuthenticationState.unknown());
        break;
    }
  }

  Future<void> _handleAuthenticated(Emitter<AuthenticationState> emit) async {
    try {
      final user = _userRepository.currentUser;
      if (user == null) {
        Log.error('User is null after authentication');
        emit(AuthenticationState.unauthenticated());
        return;
      }
      emit(AuthenticationState.authenticated(user));
    } catch (e) {
      Log.error('Error while fetching user during authentication: $e');
      emit(AuthenticationState.unauthenticated());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logout();
    emit(AuthenticationState.unauthenticated());
  }
}
