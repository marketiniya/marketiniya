import 'package:flutter/material.dart';
import 'package:marketinya/config/responsive_layout.dart';
import 'package:marketinya/screens/services/layouts/service_desktop_layout.dart';
import 'package:marketinya/screens/services/layouts/service_mobile_layout.dart';


class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: ServiceMobileLayout(),
      desktop: ServiceDesktopLayout(),
    );
  }
}