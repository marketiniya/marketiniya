import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  static const mobileScreenLimit = 1265;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < mobileScreenLimit) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
