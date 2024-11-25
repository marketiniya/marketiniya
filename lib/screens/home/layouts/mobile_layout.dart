import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_mobile.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBarMobile(),
        ],
      ),
    );
  }
}
