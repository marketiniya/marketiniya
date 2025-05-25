part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(Status.initial) Status status,
    @Default('') String email,
    @Default('') String password,
    String? errorMessage,
  }) = _LoginState;
}