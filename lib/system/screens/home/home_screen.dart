import 'package:flutter/material.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/system/widgets/pages/system_app_bar_layout.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleLogout() {
    getIt<AuthenticationRepository>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return SystemAppBarLayout(
      userName: 'Тодор Тодоров',
      onLogout: _handleLogout,
    );
  }
}
