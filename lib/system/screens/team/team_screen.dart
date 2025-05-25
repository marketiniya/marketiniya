import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: const Center(
        child: Text(
          'Team Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 