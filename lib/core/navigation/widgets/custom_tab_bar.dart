import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/widgets/tab_bar_content.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.onTabTapped,
    required this.logoWidth,
    required this.logoHeight,
    required this.fontSize,
  });

  final TabController tabController;
  final Function(int) onTabTapped;
  final double logoWidth;
  final double logoHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 800;
        final isMediumScreen = screenWidth < 1200;

        final horizontalPadding = isSmallScreen
            ? 100.0
            : isMediumScreen
                ? 180.0
                : 240.0;

        return TabBarContent(
          tabController: tabController,
          onTabTapped: onTabTapped,
          logoWidth: logoWidth,
          logoHeight: logoHeight,
          fontSize: fontSize,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          horizontalPadding: horizontalPadding,
        );
      },
    );
  }
}
