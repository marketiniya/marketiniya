import 'package:flutter/material.dart';
import 'package:marketinya/core/navigation/widgets/bottom_divider_and_label.dart';
import 'package:marketinya/core/navigation/widgets/tab_bar_content.dart';

class CustomAppBarShell extends StatelessWidget {
  const CustomAppBarShell({
    super.key,
    required this.tabController,
    required this.onTabTapped,
  });

  final TabController tabController;
  final void Function(int) onTabTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarContent(
          tabController: tabController,
          onTabTapped: onTabTapped,
        ),
        const BottomDividerAndLabel(),
      ],
    );
  }
}
