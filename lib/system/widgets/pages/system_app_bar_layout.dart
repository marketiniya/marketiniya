import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/widgets/app_bar/system_navigation_items.dart';
import 'package:marketinya/system/widgets/system_app_bar.dart';

class SystemAppBarLayout extends StatefulWidget {
  final String userName;
  final VoidCallback onLogout;

  const SystemAppBarLayout({
    super.key,
    required this.userName,
    required this.onLogout,
  });

  @override
  State<SystemAppBarLayout> createState() => _SystemAppBarLayoutState();
}

class _SystemAppBarLayoutState extends State<SystemAppBarLayout> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: SystemNavigationItems.items.length,
      vsync: this,
    );
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  Widget _buildTabView(SystemNavigationItem item) {
    return Center(
      child: Text(item.label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SystemAppBar(
        userName: widget.userName,
        onLogout: widget.onLogout,
        selectedIndex: _tabController.index,
        onNavigationChanged: (index) => _tabController.animateTo(index),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: SystemNavigationItems.items
            .map((item) => _buildTabView(item))
            .toList(),
      ),
    );
  }
}
