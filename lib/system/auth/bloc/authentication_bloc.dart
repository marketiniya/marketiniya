import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/user.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

@injectable
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this._userRepository, {
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<Authentication> _authenticationStatusSubscription;
  final UserRepository _userRepository;

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
        emit(const AuthenticationState.unauthenticated());
        break;
      case Authentication.unknown:
        emit(const AuthenticationState.unknown());
        break;
    }
  }

  Future<void> _handleAuthenticated(Emitter<AuthenticationState> emit) async {
    try {
      final user = _userRepository.currentUser;
      if (user == null) {
        Log.error('User is null after authentication');
        emit(const AuthenticationState.unauthenticated());
        return;
      }
      emit(AuthenticationState.authenticated(user));
    } catch (e) {
      Log.error('Error while fetching user during authentication: $e');
      emit(const AuthenticationState.unauthenticated());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logout();
    emit(const AuthenticationState.unauthenticated());
  }
}
