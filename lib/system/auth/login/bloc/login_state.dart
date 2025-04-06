part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = Status.initial,
    this.email = '',
    this.password = '',
    this.isValid = false,
  });

  final Status status;
  final String email;
  final String password;
  final bool isValid;

  LoginState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}
