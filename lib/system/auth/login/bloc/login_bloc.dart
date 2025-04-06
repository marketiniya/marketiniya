import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

/// Bloc for managing login functionality.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  /// Constructs a LoginBloc which handles the login process using an AuthenticationRepository.
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  /// Handles the login submission, attempts login through the repository repository,
  /// and resets state after handling results.
  Future<void> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _authenticationRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(status: Status.success));
      emit(const LoginState());
    } catch (_) {
      emit(state.copyWith(status: Status.error));
      emit(const LoginState());
    }
  }
}
