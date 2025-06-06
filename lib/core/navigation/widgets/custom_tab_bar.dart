import 'package:flutter/material.dart';
import 'package:marketinya/core/navigation/widgets/tab_button_wrapper.dart';
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
    return SizedBox(
      height: logoHeight + 20, // Adjust height to accommodate logo
      child: Row(
        children: [
          // Left tabs (Начало, Блог)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildTabButton(context, 'Начало', 0)),
                Expanded(child: _buildTabButton(context, 'Блог', 1)),
              ],
            ),
          ),
          // Logo in center
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MarketiniyaLogo(width: logoWidth, height: logoHeight),
          ),
          // Right tabs (Услуги, Contact button)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildTabButton(context, 'Услуги', 2)),
                Expanded(child: _buildContactButton(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String label, int index) {
    final isActive = tabController.index == index;

    return TabButtonWrapper(
      key: ValueKey('tab_button_$index'),
      isActive: isActive,
      onTap: () {
        // Only call the navigation callback, don't animate TabController
        onTabTapped(index);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          color: isActive
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    final isActive = tabController.index == 3;

    return TabButtonWrapper(
      key: const ValueKey('contact_button'),
      isActive: isActive,
      onTap: () {
        onTabTapped(3);
      },
      isContactButton: true,
      child: const Text(
        'Свържи се с нас',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
