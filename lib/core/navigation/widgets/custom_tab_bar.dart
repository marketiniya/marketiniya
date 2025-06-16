import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/navigation/routes.dart';
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
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 800;
        final isMediumScreen = screenWidth < 1200;

        final horizontalPadding = isSmallScreen
            ? 100.0
            : isMediumScreen
                ? 180.0
                : 240.0;

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

        final containerHeight = math.max(responsiveLogoHeight + 10, 75.0);

        return Container(
          height: containerHeight,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isSmallScreen ? 3 : 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _buildTabButton(context, 'Начало', 0)),
                    SizedBox(width: isSmallScreen ? 15 : 20), // 1/3 more space between first 2 buttons
                    Expanded(child: _buildTabButton(context, 'Блог', 1)),
                  ],
                ),
              ),
              SizedBox(
                width: responsiveLogoWidth + (isSmallScreen ? 15 : 25),
                child: Center(
                  child: MarketiniyaLogo(
                    width: responsiveLogoWidth,
                    height: responsiveLogoHeight,
                  ),
                ),
              ),
              Expanded(
                flex: isSmallScreen ? 3 : 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 6,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: isSmallScreen ? 80 : 100,
                          maxWidth: isSmallScreen ? 110 : 350,
                        ),
                        child: _buildTabButton(context, 'Услуги', 2),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 7,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: isSmallScreen ? 130 : 160,
                          maxWidth: isSmallScreen ? 170 : 220,
                        ),
                        child: _buildContactButton(context),
                      ),
                    ),
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
    if (location.startsWith(Routes.home.path)) {
      return 'Начало';
    } else if (location.startsWith(Routes.blog.path)) {
      return 'Блог';
    } else if (location.startsWith(Routes.services.path)) {
      return 'Услуги';
    } else if (location.startsWith(Routes.connectWithUs.path)) {
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
