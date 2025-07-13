import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.scrollable = false,
    this.contentMaxWidth = imageWidth,
  });

  factory CustomAlertDialog.deleteConfirmation({
    Key? key,
    Widget? content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) =>
      _DeleteConfirmationDialog(
        key: key,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );

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

class _DeleteConfirmationDialog extends CustomAlertDialog {
  _DeleteConfirmationDialog({
    super.key,
    Widget? content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) : super(
          title: const Text(
            'Сигурни ли сте, че искате да изтриете?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          content: content ?? const SizedBox.shrink(),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: PrimaryButton.responsive(
                    title: 'Да',
                    icon: const Icon(Icons.check, size: xs),
                    activeTitleColor: Colors.red,
                    borderColor: Colors.red,
                    backgroundColor: Colors.white,
                    overlayButtonColor: Colors.red.withValues(alpha: 200),
                    onPressed: onConfirm,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: PrimaryButton.responsive(
                    title: 'Не',
                    icon: const Icon(Icons.close, size: xs),
                    backgroundColor: Colors.white,
                    activeTitleColor: AppColors.oliveGreen,
                    borderColor: Colors.grey.shade400,
                    overlayButtonColor: AppColors.lightBeige,
                    onPressed: onCancel,
                  ),
                ),
              ],
            ),
          ],
        );
}