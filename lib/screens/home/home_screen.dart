import 'package:flutter/material.dart';
import 'package:marketinya/config/responsive_layout.dart';
import 'package:marketinya/screens/home/layouts/home_desktop_layout.dart';
import 'package:marketinya/screens/home/layouts/home_mobile_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: HomeMobileLayout(),
      desktop: HomeDesktopLayout(),
    );
  }
}
