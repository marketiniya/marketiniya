import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.scrollable = false,
  });

  final bool scrollable;
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: scrollable,
      title: title,
      content: content,
      actions: actions,
    );
  }
}