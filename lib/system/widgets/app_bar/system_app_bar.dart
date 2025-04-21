import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/widgets/app_bar/system_app_bar_layout.dart';
import 'package:marketinya/system/widgets/app_bar/top_section.dart';

class SystemAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int)? onNavigationChanged;

  const SystemAppBar({
    super.key,
    this.selectedIndex = 0,
    this.onNavigationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        const baseWidth = 1700;
        final scaleFactor = (width / baseWidth).clamp(0.8, 1.0);

        final horizontalPadding = width * 0.15;
        final tabSpacing = xxsPlus * scaleFactor;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.lightBeige,
                AppColors.mutedOlive,
              ],
              stops: [0.2, 1.0],
            ),
          ),
          child: Column(
            children: [
              const TopSection(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tabs.asMap().entries.map((tab) {
                          final index = tab.key;
                          final item = tab.value;
                          final isSelected = selectedIndex == index;

                          return Padding(
                            padding: EdgeInsets.only(right: tabSpacing),
                            child: TextButton.icon(
                              onPressed: () => onNavigationChanged?.call(index),
                              icon: Icon(
                                item.icon,
                                size: sm * scaleFactor, // Scale the icon size
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.textPrimary,
                              ),
                              label: Text(
                                item.label,
                                style: GoogleFonts.roboto(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                                  fontSize: xs * scaleFactor,
                                  // Scale the text size
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(xxsPlus),
                                  ),
                                ),
                                foregroundColor: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
