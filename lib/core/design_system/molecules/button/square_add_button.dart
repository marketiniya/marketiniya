import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class SquareAddButton extends StatelessWidget {
  const SquareAddButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = AppColors.oliveGreen,
    this.iconColor = Colors.white,
  });

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lg,
      height: lg,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(xxsPlus),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(xxsPlus),
          child: Icon(
            Icons.add,
            color: iconColor,
            size: sm,
          ),
        ),
      ),
    );
  }
}
