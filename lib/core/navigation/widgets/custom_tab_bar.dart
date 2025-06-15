import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/navigation/widgets/contact_button.dart';
import 'package:marketinya/core/navigation/widgets/responsive_tab_button.dart';
import 'package:marketinya/website/widgets/appBar/widgets/marketiniya_logo.dart';

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
        // Calculate responsive values based on screen width
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 800;
        final isMediumScreen = screenWidth < 1200;

        final horizontalPadding = isSmallScreen
            ? 40.0
            : isMediumScreen
                ? 80.0
                : 120.0;

        // Responsive logo size
        final responsiveLogoWidth = isSmallScreen
            ? logoWidth * 0.7
            : isMediumScreen
                ? logoWidth * 0.85
                : logoWidth;

        final responsiveLogoHeight = isSmallScreen
            ? logoHeight * 0.7
            : isMediumScreen
                ? logoHeight * 0.85
                : logoHeight;

        // Calculate container height to accommodate bigger buttons
        final containerHeight = math.max(responsiveLogoHeight + 20,
            100.0); // Minimum 100px for bigger buttons

        return Container(
          height: containerHeight,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Center align all elements
            children: [
              // Left tabs (Начало, Блог)
              Expanded(
                flex: isSmallScreen ? 3 : 2, // More space on small screens
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _buildTabButton(context, 'Начало', 0)),
                    Expanded(child: _buildTabButton(context, 'Блог', 1)),
                  ],
                ),
              ),
              // Logo in center - responsive width
              SizedBox(
                width: responsiveLogoWidth + (isSmallScreen ? 20 : 40),
                child: Center(
                  child: MarketiniyaLogo(
                    width: responsiveLogoWidth,
                    height: responsiveLogoHeight,
                  ),
                ),
              ),
              // Right tabs (Услуги, Contact button)
              Expanded(
                flex: isSmallScreen ? 3 : 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                        ),
                        child: _buildTabButton(context, 'Услуги', 2),
                      ),
                    ),
                    _buildContactButton(context),
                    const SizedBox(width: 35),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabButton(BuildContext context, String label, int index) {
    return ResponsiveTabButton(
      key: ValueKey('tab_button_$index'),
      label: label,
      activeTab: _getCurrentActiveTab(context),
      onPressed: () => onTabTapped(index),
      fontSize: fontSize,
    );
  }

  String _getCurrentActiveTab(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(GoRouterPaths.home.path)) {
      return 'Начало';
    } else if (location.startsWith(GoRouterPaths.blog.path)) {
      return 'Блог';
    } else if (location.startsWith(GoRouterPaths.services.path)) {
      return 'Услуги';
    } else if (location.startsWith(GoRouterPaths.connectWithUs.path)) {
      return 'Свържи се с нас';
    }
    return 'Начало';
  }

  Widget _buildContactButton(BuildContext context) {
    final isActive = tabController.index == 3;

    return ContactButton(
      key: const ValueKey('contact_button'),
      isActive: isActive,
      onPressed: () => onTabTapped(3),
      fontSize: fontSize,
    );
  }
}
