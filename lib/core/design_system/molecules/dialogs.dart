import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.scrollable = false,
    this.contentMaxWidth = 280,
  });

  final bool scrollable;
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  final double contentMaxWidth;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: scrollable,
      title: title,
      content: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),
        child: content,
      ),
      actions: actions,
    );
  }
}