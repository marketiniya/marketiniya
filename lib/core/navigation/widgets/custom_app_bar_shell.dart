import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/widgets/bottom_divider_and_label.dart';
import 'package:marketinya/core/navigation/widgets/custom_tab_bar.dart';

class CustomAppBarShell extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarShell({
    super.key,
    required this.tabController,
    required this.onTabTapped,
    required this.logoWidth,
    required this.logoHeight,
    required this.fontSize,
    required this.dividerHeight,
    this.toolbarHeight = kToolbarHeight,
  });

  final TabController tabController;
  final void Function(int) onTabTapped;
  final double logoWidth;
  final double logoHeight;
  final double fontSize;
  final double dividerHeight;
  final double toolbarHeight;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight + logoHeight + lg);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(logoHeight + lg),
        child: Column(
          children: [
            CustomTabBar(
              tabController: tabController,
              onTabTapped: onTabTapped,
              logoWidth: logoWidth,
              logoHeight: logoHeight,
              fontSize: fontSize,
            ),
            BottomDividerAndLabel(
              logoWidth: logoWidth,
              dividerHeight: dividerHeight,
            ),
          ],
        ),
      ),
    );
  }
}
