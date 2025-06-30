import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/responsive_layout.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/widgets/custom_app_bar_shell.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_mobile.dart';

class TabNavigationScreenShell extends StatefulWidget {
  const TabNavigationScreenShell({super.key, required this.child});

  final Widget child;

  @override
  State<TabNavigationScreenShell> createState() =>
      _TabNavigationScreenShellState();
}

class _TabNavigationScreenShellState extends State<TabNavigationScreenShell>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final route = Routes.fromPath(location);

    if (route.tabIndex != null && _tabController.index != route.tabIndex!) {
      _tabController.index = route.tabIndex!;
    }
  }

  void _onTabTapped(int index) {
    if (index >= 0 && index < Routes.publicTabRoutes.length) {
      context.go(Routes.publicTabRoutes[index].path);
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
        preferredSize: Size.fromHeight(
          MediaQuery.sizeOf(context).width >= 1265 ? 186 : 65,
        ),
        child: ResponsiveLayout(
          mobile: CustomAppBarMobile(
            onTabTapped: _onTabTapped,
          ),
          desktop: CustomAppBarShell(
            tabController: _tabController,
            onTabTapped: _onTabTapped,
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
