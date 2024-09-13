import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';

extension ContextExtension on BuildContext {

  void showFailureSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(message, textAlign: TextAlign.center),
        ),
      );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: ColorUtils.limeGreen,
          content: Text(message, textAlign: TextAlign.center),
        ),
      );
  }
}