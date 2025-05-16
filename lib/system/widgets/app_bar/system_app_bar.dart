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
        final screenSize = MediaQuery.sizeOf(context);
        final availableWidth = screenSize.width * 0.75;
        final baseTabWidth = availableWidth / tabs.length;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.lightBeige,
                AppColors.dustyOlive,
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
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width <= 1344
                          ? screenSize.width * 0.10
                          : screenSize.width * 0.15,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...tabs.asMap().entries.map((tabItem) {
                            final index = tabItem.key;
                            final tab = tabItem.value;
                            final isSelected = selectedIndex == index;

                            // Give extra width to tabs with longer text
                            final extraWidth =
                                tab.label.length > 8 ? 20.0 : 5.0;

                            return SizedBox(
                              width: baseTabWidth + extraWidth,
                              child: TextButton.icon(
                                onPressed: tab.isEnabled
                                    ? () => onNavigationChanged?.call(index)
                                    : null,
                                icon: Icon(
                                  tab.icon,
                                  size: sm,
                                  color: tab.isEnabled
                                      ? (isSelected
                                          ? AppColors.primary
                                          : AppColors.textPrimary)
                                      : Theme.of(context).disabledColor,
                                ),
                                label: Text(
                                  tab.label,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    color: tab.isEnabled
                                        ? (isSelected
                                            ? AppColors.primary
                                            : AppColors.textPrimary)
                                        : Theme.of(context).disabledColor,
                                    fontSize: xs,
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
                                  minimumSize: const Size.fromHeight(xl),
                                  padding: const EdgeInsets.symmetric(horizontal: xs),
                                ),
                              ),
                            );
                          }),
                        ],
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
