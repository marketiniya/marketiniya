import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/design_system/atoms/images/marketiniya_images.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/widgets/contact_button.dart';
import 'package:marketinya/core/navigation/widgets/responsive_tab_button.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({
    super.key,
    required this.tabController,
    required this.onTabTapped,
  });

  final TabController tabController;
  final Function(int) onTabTapped;

  static const String homeTab = 'Начало';
  static const String blogTab = 'Блог';
  static const String servicesTab = 'Услуги';
  static const String contactTab = 'Свържи се с нас';
  static const double logoWidth = 126;
  static const double logoHeight = 100;
  static const double fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 180),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ResponsiveTabButton(
                    key: const ValueKey('tab_button_${0}'),
                    label: homeTab,
                    isActive: _isTabActive(context, homeTab),
                    onPressed: () => onTabTapped(0),
                    fontSize: fontSize,
                  ),
                ),
                Expanded(
                  child: ResponsiveTabButton(
                    key: const ValueKey('tab_button_${1}'),
                    label: blogTab,
                    isActive: _isTabActive(context, blogTab),
                    onPressed: () => onTabTapped(1),
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 45, right: 45, top: 8, bottom: 8),
            child: MarketiniyaImages.marketiniyaLogo(
              width: logoWidth,
              height: logoHeight,
            ),
          ),
          Expanded(
            child: ResponsiveTabButton(
              key: const ValueKey('tab_button_${2}'),
              label: servicesTab,
              isActive: _isTabActive(context, servicesTab),
              onPressed: () => onTabTapped(2),
              fontSize: fontSize,
            ),
          ),
          Expanded(
            child: ContactButton(
              key: const ValueKey('contact_button'),
              isActive: _isTabActive(context, contactTab),
              onPressed: () => onTabTapped(3),
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  bool _isTabActive(BuildContext context, String tabName) {
    final location = GoRouterState.of(context).uri.path;
    switch (tabName) {
      case homeTab:
        return location.startsWith(Routes.home.path);
      case blogTab:
        return location.startsWith(Routes.blog.path);
      case servicesTab:
        return location.startsWith(Routes.services.path);
      case contactTab:
        return location.startsWith(Routes.connectWithUs.path);
      default:
        return false;
    }
  }
}
