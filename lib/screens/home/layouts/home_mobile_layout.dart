import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_mobile.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBarMobile(activeTab: 'Начало'),
        ],
      ),
    );
  }
}
