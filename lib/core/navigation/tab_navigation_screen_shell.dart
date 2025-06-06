import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/navigation/widgets/bottom_divider_and_label.dart';
import 'package:marketinya/core/navigation/widgets/custom_tab_bar.dart';

class TabNavigationScreen extends StatefulWidget {

  const TabNavigationScreen({super.key, required this.child});
  final Widget child;

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const double _fontSize = 20;
  static const double _toolbarHeight = 50; // Reduced from 180 to remove empty space
  static const double _logoHeight = 120; // Increased from 100
  static const double _logoWidth = 150; // Increased from 126
  static const double _dividerHeight = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabIndex();
  }

  void _updateTabIndex() {
    final location = GoRouterState.of(context).uri.path;
    int index = 0;
    if (location.startsWith(GoRouterPaths.home.path)) {
      index = 0;
    } else if (location.startsWith(GoRouterPaths.blog.path)) {
      index = 1;
    } else if (location.startsWith(GoRouterPaths.services.path)) {
      index = 2;
    } else if (location.startsWith(GoRouterPaths.connectWithUs.path)) {
      index = 3;
    }

    if (_tabController.index != index) {
      _tabController.index = index;
    }
  }

  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        context.go(GoRouterPaths.home.path);
        break;
      case 1:
        context.go(GoRouterPaths.blog.path);
        break;
      case 2:
        context.go(GoRouterPaths.services.path);
        break;
      case 3:
        context.go(GoRouterPaths.connectWithUs.path);
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: widget.child, // Let GoRouter handle the content
    );
  }

  PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: _toolbarHeight,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_logoHeight + 40), // Space for logo + tab bar
        child: Column(
          children: [
            CustomTabBar(
              tabController: _tabController,
              onTabTapped: _onTabTapped,
              logoWidth: _logoWidth,
              logoHeight: _logoHeight,
              fontSize: _fontSize,
            ),
            const BottomDividerAndLabel(
              logoWidth: _logoWidth,
              dividerHeight: _dividerHeight,
            ),
          ],
        ),
      ),
    );
  }

}
