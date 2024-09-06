import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';

class CustomTheme {
  static ThemeData get customThemeData {
    return ThemeData(
      primaryColor: ColorUtils.charcoal,
      scaffoldBackgroundColor: ColorUtils.charcoal,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorUtils.charcoal, // App bar color
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorUtils.lightGray, // Primary color for buttons and controls
        secondary: ColorUtils.limeGreen, // Secondary color for contrast (if needed)
        onPrimary: Colors.white, // Text color on primary surfaces
        onSecondary: Colors.black, // Text color on secondary surfaces
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: ColorUtils.lightGray), // Main text color (for readability)
        bodyMedium: TextStyle(color: ColorUtils.lightGray), // Text color for smaller elements
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorUtils.charcoal, // Button text color
          backgroundColor: ColorUtils.limeGreen, // Button background color
        ),
      ),
    );
  }
}
