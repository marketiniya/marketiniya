import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/utils/firebase_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

/// Bloc for managing login functionality.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._authenticationRepository,
  ) : super(LoginState()) {
    on<_OnLoad>(_onLoad);
    on<_OnEmailChanged>(_onEmailChanged);
    on<_OnPasswordChanged>(_onPasswordChanged);
    on<_OnSubmitted>(_onSubmitted);

    add(const LoginEvent.onLoad());
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onLoad(_OnLoad event, Emitter<LoginState> emit) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      emit(state.copyWith(appVersion: packageInfo.version));
    } catch (e) {
      emit(state.copyWith(appVersion: 'Unknown'));
    }
  }

  Future<void> _onEmailChanged(
    _OnEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(email: event.email, status: Status.initial));
  }

  Future<void> _onPasswordChanged(
    _OnPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password, status: Status.initial));
  }

  Future<void> _onSubmitted(_OnSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _authenticationRepository.login(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: Status.success));
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseUtils.getErrorMessage(e);
      emit(state.copyWith(status: Status.error, errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
    }
  }
}
