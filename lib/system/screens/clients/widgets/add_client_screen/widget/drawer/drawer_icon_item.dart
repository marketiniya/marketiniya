import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class DrawerIconItem extends StatelessWidget {
  const DrawerIconItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    this.selected = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final int index;
  final bool selected;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: Column(
        children: [
          Padding(
            padding: dimen.horizontal.xxsPlus,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: selected ? AppColors.mutedOlive : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: Icon(icon, size: sm),
                onPressed: () => onTap?.call(index),
              ),
            ),
          ),
          const SizedBox(height: micro),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: xxsPlus,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
