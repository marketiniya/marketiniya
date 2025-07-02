import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_editor_tab.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/drawer/drawer_icon_item.dart';

class ClientsDrawer extends StatelessWidget {
  const ClientsDrawer({
    super.key,
    required this.availableTabs,
    this.onItemSelected,
    this.selectedIndex = 0,
  });

  final List<ClientEditorTab> availableTabs;
  final void Function(int index)? onItemSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dimen.top.sm,
      child: Drawer(
        elevation: xs,
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
              ...availableTabs.asMap().entries.map(
                (tabEntry) {
                  final index = tabEntry.key;
                  final tab = tabEntry.value;
                  return Column(
                    children: [
                      DrawerIconItem(
                        index: index,
                        icon: tab.icon,
                        label: tab.label,
                        selected: selectedIndex == index,
                        onTap: onItemSelected,
                      ),
                      const SizedBox(height: xs),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
