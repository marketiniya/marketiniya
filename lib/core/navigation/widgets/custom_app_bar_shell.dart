import 'package:flutter/material.dart';
import 'package:marketinya/core/navigation/widgets/bottom_divider_and_label.dart';
import 'package:marketinya/core/navigation/widgets/tab_bar_content.dart';

class CustomAppBarShell extends StatelessWidget {
  const CustomAppBarShell({
    super.key,
    required this.tabController,
    required this.onTabTapped,
    required this.logoWidth,
    required this.labelLogoWidth,
    required this.logoHeight,
    required this.fontSize,
    required this.dividerHeight,
  });

  final TabController tabController;
  final void Function(int) onTabTapped;
  final double logoWidth;
  final double labelLogoWidth;
  final double logoHeight;
  final double fontSize;
  final double dividerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarContent(
          tabController: tabController,
          onTabTapped: onTabTapped,
          logoWidth: logoWidth,
          logoHeight: logoHeight,
          fontSize: fontSize,
        ),
        BottomDividerAndLabel(
          labelLogoWidth: labelLogoWidth,
          dividerHeight: dividerHeight,
        ),
      ],
    );
  }
}
