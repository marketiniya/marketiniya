import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/enums/client_tab.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/drawer/drawer_icon_item.dart';

class ClientsDrawer extends StatelessWidget {
  const ClientsDrawer({
    super.key,
    this.onItemSelected,
    this.selectedIndex = 0,
  });

  final void Function(int index)? onItemSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dimen.top.sm,
      child: Drawer(
        elevation: 15,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        width: lg + lg,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.dustyOlive,
                AppColors.lightBeige,
              ],
              stops: [0.4, 1.0],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(height: lg),
              ...ClientTab.values.map(
                (tab) => Column(
                  children: [
                    DrawerIconItem(
                      icon: tab.icon,
                      label: tab.label,
                      index: tab.tabIndex,
                      selected: selectedIndex == tab.tabIndex,
                      onTap: onItemSelected,
                    ),
                    const SizedBox(height: xs),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
