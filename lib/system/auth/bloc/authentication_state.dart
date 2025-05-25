import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/models/user.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required Authentication status,
    User? user,
  }) = _AuthenticationState;

  factory AuthenticationState.unknown() =>
      const AuthenticationState(status: Authentication.unknown);

  factory AuthenticationState.authenticated(User user) =>
      AuthenticationState(status: Authentication.authenticated, user: user);

  factory AuthenticationState.unauthenticated() =>
      const AuthenticationState(status: Authentication.unauthenticated);
}
