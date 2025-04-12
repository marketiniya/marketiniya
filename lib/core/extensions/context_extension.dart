import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';

extension ContextExtension on BuildContext {
  void push(Widget screen, {String? routeName}) {
    Navigator.of(this).push(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (ctx) => screen,
      ),
    );
  }

  void pushReplacement(Widget screen, {String? routeName}) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (ctx) => screen,
      ),
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

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
