import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/icons/marketiniya_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/tertiary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView({
    super.key,
    this.title,
    this.message,
    this.errorIcon,
    this.onRetry,
    this.messageColor,
    this.actionLabel,
    this.centerContent = true,
    this.padding = const EdgeInsets.all(xs),
  });

  final String? title;
  final String? message;
  final Widget? errorIcon;
  final VoidCallback? onRetry;
  final Color? messageColor;
  final String? actionLabel;
  final bool centerContent;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    const defaultMessage = 'We were unable to complete your request. Please try again.';
    final icon = errorIcon ?? MarketiniyaIcons.info();

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          icon,
          if (title != null) ...[_buildTitle()],
          _buildMessage(defaultMessage),
          if (onRetry != null) _buildRetryButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: xs),
      child: Center(
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildMessage(String defaultMessage) {
    return Padding(
      padding: const EdgeInsets.only(top: xs),
      child: Center(
        child: Text(
          message ?? defaultMessage,
          textAlign: TextAlign.center,
          style: TextStyle(color: messageColor ?? Colors.black),
        ),
      ),
    );
  }

  Widget _buildRetryButton() {
    return Padding(
      padding: const EdgeInsets.only(top: xs),
      child: Center(
        child: TertiaryButton.responsive(
          title: actionLabel ?? 'Retry',
          onPressed: onRetry,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.oliveGreen),
          ),
        ),
      ),
    );
  }
}
