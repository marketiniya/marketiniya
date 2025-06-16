import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/responsive_layout.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/widgets/custom_app_bar_shell.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_mobile.dart';

class TabNavigationScreenShell extends StatefulWidget {
  const TabNavigationScreenShell({super.key, required this.child});

  final Widget child;

  @override
  State<TabNavigationScreenShell> createState() => _TabNavigationScreenShellState();
}

class _TabNavigationScreenShellState extends State<TabNavigationScreenShell>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const double _fontSize = 18;
  static const double _toolbarHeight = 40;
  static const double _logoHeight = 90;
  static const double _logoWidth = 135;
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
    var index = 0;
    if (location.startsWith(Routes.home.path)) {
      index = 0;
    } else if (location.startsWith(Routes.blog.path)) {
      index = 1;
    } else if (location.startsWith(Routes.services.path)) {
      index = 2;
    } else if (location.startsWith(Routes.connectWithUs.path)) {
      index = 3;
    }

    if (_tabController.index != index) {
      _tabController.index = index;
    }
  }

  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        context.go(Routes.home.path);
        break;
      case 1:
        context.go(Routes.blog.path);
        break;
      case 2:
        context.go(Routes.services.path);
        break;
      case 3:
        context.go(Routes.connectWithUs.path);
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(_toolbarHeight + _logoHeight + lg),
        child: ResponsiveLayout(
          mobile: const CustomAppBarMobile(
            activeTab: 'Начало',
          ),
          desktop: CustomAppBarShell(
            tabController: _tabController,
            onTabTapped: _onTabTapped,
            logoWidth: _logoWidth,
            logoHeight: _logoHeight,
            fontSize: _fontSize,
            dividerHeight: _dividerHeight,
            toolbarHeight: _toolbarHeight,
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
