import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/user.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription =
        _authenticationRepository.status.listen((status) => add(AuthenticationStatusChanged(status)),
        );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<Authentication> _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) async {
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
      final user = FirestoreService.instance.getCurrentUser();

      emit(AuthenticationState.authenticated(user));
        } catch (e) {
      emit(const AuthenticationState.unauthenticated());
      Log.error('Error while fetching user during repository: $e');
    }
  }

  void _onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logout();
    emit(const AuthenticationState.unauthenticated());
  }
}
