import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/widgets/contact_button.dart';
import 'package:marketinya/core/navigation/widgets/responsive_tab_button.dart';
import 'package:marketinya/website/widgets/appBar/widgets/marketiniya_logo.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({
    super.key,
    required this.tabController,
    required this.onTabTapped,
    required this.logoWidth,
    required this.logoHeight,
    required this.fontSize,
    required this.isSmallScreen,
    required this.isMediumScreen,
    required this.horizontalPadding,
  });

  final TabController tabController;
  final Function(int) onTabTapped;
  final double logoWidth;
  final double logoHeight;
  final double fontSize;
  final bool isSmallScreen;
  final bool isMediumScreen;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: ResponsiveTabButton(
                    key: const ValueKey('tab_button_${0}'),
                    label: "Начало",
                    activeTab: _getCurrentActiveTab(context),
                    onPressed: () => onTabTapped(0),
                    fontSize: fontSize,
                  ),
                ),
                SizedBox(width: isSmallScreen ? 15 : 20),
                Expanded(
                  child: ResponsiveTabButton(
                    key: const ValueKey('tab_button_${1}'),
                    label: "Блог",
                    activeTab: _getCurrentActiveTab(context),
                    onPressed: () => onTabTapped(1),
                    fontSize: fontSize,
                  ),
                ),
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
                    child: ResponsiveTabButton(
                      key: const ValueKey('tab_button_${2}'),
                      label: "Услуги",
                      activeTab: _getCurrentActiveTab(context),
                      onPressed: () => onTabTapped(2),
                      fontSize: fontSize,
                    ),
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
                    child: ContactButton(
                      key: const ValueKey('contact_button'),
                      isActive: tabController.index == 3,
                      onPressed: () => onTabTapped(3),
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
}
