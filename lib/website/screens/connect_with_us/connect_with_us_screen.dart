import 'package:flutter/material.dart';
import 'package:marketinya/core/config/responsive_layout.dart';
import 'package:marketinya/website/screens/connect_with_us/layouts/connect_with_us_desktop_layout.dart';
import 'package:marketinya/website/screens/connect_with_us/layouts/connect_with_us_mobile_layout.dart';

class ConnectWithUsScreen extends StatelessWidget {
  const ConnectWithUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: ConnectWithUsMobileLayout(),
      desktop: ConnectWithUsDesktopLayout(),
    );
  }
}