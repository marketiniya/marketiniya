import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/widgets/app_bar/top_section.dart';

import 'app_bar/system_navigation_items.dart';

class SystemAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback onLogout;
  final int selectedIndex;
  final Function(int)? onNavigationChanged;

  const SystemAppBar({
    super.key,
    required this.userName,
    required this.onLogout,
    this.selectedIndex = 0,
    this.onNavigationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lightBeige,
            AppColors.mutedOlive,
          ],
          stops: [
            0.2,
            1.0,
          ],
        ),
      ),
      child: Column(
        children: [
          const TopSection(),
          _buildNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: SystemNavigationItems.items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextButton.icon(
            onPressed: () => onNavigationChanged?.call(index),
            icon: Icon(
              item.icon,
              size: sm,
              color: isSelected ? AppColors.selectedNav : AppColors.textPrimary,
            ),
            label: Text(
              item.label,
              style: GoogleFonts.roboto(
                color:
                    isSelected ? AppColors.selectedNav : AppColors.textPrimary,
                textStyle: const TextStyle(
                  fontSize: xs,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 16.5),
              backgroundColor: isSelected
                  ? Colors.white // selected tab background
                  : Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              foregroundColor: Colors.black,
            ),

          ),
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
