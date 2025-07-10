import 'package:flutter/material.dart';

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
          backgroundColor: Colors.green,
          content: Text(message, textAlign: TextAlign.center),
        ),
      );
  }
}
