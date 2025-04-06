part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState._({this.user, required this.status});

  const AuthenticationState.unknown() : this._(status: Authentication.unknown);

  const AuthenticationState.authenticated(User user)
      : this._(user: user, status: Authentication.authenticated);

  const AuthenticationState.unauthenticated()
      : this._(status: Authentication.unauthenticated);

  final User? user;
  final Authentication status;

  @override
  List<Object?> get props => [user, status];
}