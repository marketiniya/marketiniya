import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/system_tab.dart';
import 'package:marketinya/system/screens/clients/clients_screen.dart';
import 'package:marketinya/system/screens/team/team_screen.dart';
import 'package:marketinya/system/widgets/app_bar/system_app_bar.dart';

const List<SystemTab> tabs = [
  SystemTab.clients,
  SystemTab.team,
  SystemTab.orders,
  SystemTab.tasks,
  SystemTab.services,
  SystemTab.calendar,
  SystemTab.labels,
  SystemTab.profile,
  SystemTab.history,
];

class SystemAppBarLayout extends StatefulWidget {
  const SystemAppBarLayout({
    super.key,
  });

  @override
  State<SystemAppBarLayout> createState() => _SystemAppBarLayoutState();
}

class _SystemAppBarLayoutState extends State<SystemAppBarLayout>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
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

  Widget _buildTabView(SystemTab tab) {
    switch (tab) {
      case SystemTab.clients:
        return const ClientsScreen();
      case SystemTab.team:
        return const TeamScreen();
      default:
        return Center(
          child: Text(tab.label),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SystemAppBar(
        selectedIndex: _tabController.index,
        onNavigationChanged: (index) => _tabController.animateTo(index),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: tabs.map((tab) => _buildTabView(tab)).toList(),
      ),
    );
  }
}
