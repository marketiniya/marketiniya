import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/loader_widget.dart';
import 'package:marketinya/core/enums/action_button_size.dart';

/// Tertiary button only uses {responsive} and {small} enum values

class TertiaryButton extends StatelessWidget {
  const TertiaryButton._({
    super.key,
    required this.title,
    required this.isLoading,
    required ActionButtonSize buttonType,
    this.onPressed,
    this.icon,
    this.padding,
    this.style,
    this.isDestructive = false,
  }) : _buttonType = buttonType;

  factory TertiaryButton.responsive({
    Key? key,
    required String title,
    bool isLoading = false,
    VoidCallback? onPressed,
    Widget? icon,
    EdgeInsets? padding,
    ButtonStyle? style,
  }) =>
      TertiaryButton._(
        key: key,
        title: title,
        isLoading: isLoading,
        buttonType: ActionButtonSize.responsive,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        style: style,
      );

  factory TertiaryButton.small({
    Key? key,
    required String title,
    bool isLoading = false,
    VoidCallback? onPressed,
    Widget? icon,
    EdgeInsets? padding,
    ButtonStyle? style,
  }) =>
      TertiaryButton._(
        key: key,
        title: title,
        isLoading: isLoading,
        buttonType: ActionButtonSize.small,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        style: style,
      );

  factory TertiaryButton.destructive({
    Key? key,
    required String title,
    VoidCallback? onPressed,
    Widget? icon,
    EdgeInsets? padding,
    ActionButtonSize size = ActionButtonSize.blocked,
  }) =>
      TertiaryButton._(
        key: key,
        title: title,
        isLoading: false,
        buttonType: size,
        onPressed: onPressed,
        icon: icon,
        padding: padding,
        isDestructive: true,
      );

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ActionButtonSize _buttonType;
  final EdgeInsets? padding;
  final ButtonStyle? style;
  final Widget? icon;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScalerOf(context).scale(1.0);

    final style = TextButton.styleFrom(
      padding: padding,
      tapTargetSize: _buttonType == ActionButtonSize.small
          ? MaterialTapTargetSize.shrinkWrap
          : MaterialTapTargetSize.padded,
    ).merge(this.style);

    final label = isLoading
        ? _getLoaderWidget()
        : Text(
            title,
            textAlign: TextAlign.center,
          );

    final textButton = icon != null && !isLoading
        ? TextButton.icon(
            onPressed: isLoading ? null : onPressed,
            style: style,
            label: label,
            icon: _getIcon(textScaleFactor),
          )
        : TextButton(
            onPressed: isLoading ? null : onPressed,
            style: style,
            child: label,
          );

    return Semantics(
      enabled: !isLoading && onPressed != null,
      child: textButton,
    );
  }

  Widget _getLoaderWidget() => isLoading
      ? _buttonType == ActionButtonSize.small
          ? const LoaderWidget.small(loaderColor: Colors.amber)
          : const LoaderWidget(loaderColor: Colors.cyanAccent)
      : const SizedBox.shrink();

  Widget _getIcon(double textScaleFactor) {
    final iconSize =
        (_buttonType == ActionButtonSize.small ? xs : sm) * textScaleFactor;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: iconSize,
        maxWidth: iconSize,
      ),
      child: ExcludeSemantics(child: icon),
    );
  }
}
