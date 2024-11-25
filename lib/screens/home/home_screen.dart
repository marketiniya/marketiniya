import 'package:flutter/material.dart';
import 'package:marketinya/config/responsive_layout.dart';
import 'package:marketinya/screens/home/layouts/desktop_layout.dart';
import 'package:marketinya/screens/home/layouts/mobile_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileLayout(),
      desktop: DesktopLayout(),
    );
  }
}
