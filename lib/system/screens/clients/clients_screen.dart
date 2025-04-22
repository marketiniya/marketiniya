import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: const Center(
        child: Text(
          'Clients Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
