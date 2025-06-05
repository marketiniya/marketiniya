import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/website/widgets/appBar/widgets/marketiniya_logo.dart';

class TabNavigationScreen extends StatefulWidget {

  const TabNavigationScreen({super.key, required this.child});
  final Widget child;

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Constants matching CustomAppBarDesktop
  static const double _fontSize = 20;
  static const double _toolbarHeight = 180;
  static const double _logoHeight = 100;
  static const double _logoWidth = 126;
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 180,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your logo here
            const MarketiniyaLogo(width: 126, height: 100),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: _onTabTapped,
          tabAlignment: TabAlignment.center,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          labelColor: Theme.of(context).colorScheme.secondary,
          unselectedLabelColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: 'Начало',
              iconMargin: EdgeInsets.only(bottom: 4),
            ),
            Tab(
              icon: Icon(Icons.article),
              text: 'Блог',
              iconMargin: EdgeInsets.only(bottom: 4),
            ),
            Tab(
              icon: Icon(Icons.business_center),
              text: 'Услуги',
              iconMargin: EdgeInsets.only(bottom: 4),
            ),
            Tab(
              icon: Icon(Icons.contact_mail),
              text: 'Свържи се с нас',
              iconMargin: EdgeInsets.only(bottom: 4),
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
