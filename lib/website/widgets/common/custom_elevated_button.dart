import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
    this.isFilled = false,
  });

  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final bool isFilled;

  static const double _buttonHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isFilled ? Colors.grey[300]! : Colors.transparent,
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
              return Colors.grey;
            }
            return textColor;
          }),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)
                    ? Colors.grey
                    : borderColor,
                width: 1,
              ),
            );
          }),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isFilled ? FontWeight.w600 : FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
