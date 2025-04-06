import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationRepository: getIt<AuthenticationRepository>(),
      ),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
