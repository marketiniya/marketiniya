import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/radius.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/molecules/loader_widget.dart';
import 'package:marketinya/core/enums/action_button_size.dart';

class PortalActionButton extends StatelessWidget {
  const PortalActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.activeTitleColor,
    required this.disabledTitleColor,
    this.borderColor,
    required this.loaderColor,
    required this.buttonType,
    this.isLoading = false,
    this.icon,
    this.overlayButtonColor,
    this.disabledButtonColor,
    required this.buttonColor,
    this.loadingButtonColor,
    this.disabledBorderColor,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color activeTitleColor;
  final Color disabledTitleColor;
  final Color? borderColor;
  final Color loaderColor;
  final bool isLoading;
  final ActionButtonSize buttonType;
  final Widget? icon;
  final Color? overlayButtonColor;
  final Color? disabledButtonColor;
  final Color buttonColor;
  final Color? loadingButtonColor;
  final Color? disabledBorderColor;

  static const _interactiveStates = {
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScalerOf(context).scale(1.0);
    final style = _getButtonStyle();
    final onTap = isLoading ? null : onPressed;
    final label = _getLabel(context);
    final coloredIcon = _getIcon(textScaleFactor);
    final button = icon != null && !isLoading
        ? _hasBorder
        ? OutlinedButton.icon(
      onPressed: onTap,
      style: style,
      label: label,
      icon: coloredIcon,
    )
        : FilledButton.icon(
      onPressed: onTap,
      style: style,
      label: label,
      icon: coloredIcon,
    )
        : _hasBorder
        ? OutlinedButton(onPressed: onTap, style: style, child: label)
        : FilledButton(onPressed: onTap, style: style, child: label);

    return Semantics(
      enabled: !isLoading && onPressed != null,
      child: button,
    );
  }

  Widget _getLabel(BuildContext context) => isLoading
      ? _getLoaderWidget()
      : Text(
    title,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.labelLarge?.copyWith(
      color: onPressed != null ? activeTitleColor : disabledTitleColor,
    ),
  );

  Widget _getIcon(double textScaleFactor) {
    final iconSize =
        (buttonType == ActionButtonSize.small ? xs : sm) * textScaleFactor;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: iconSize,
        maxWidth: iconSize,
      ),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          onPressed != null ? activeTitleColor : disabledTitleColor,
          BlendMode.srcIn,
        ),
        child: ExcludeSemantics(child: icon),
      ),
    );
  }

  Widget _getLoaderWidget() => isLoading
      ? buttonType == ActionButtonSize.small
      ? LoaderWidget.small(loaderColor: loaderColor)
      : LoaderWidget(loaderColor: loaderColor)
      : const SizedBox.shrink();

  Color? _getFilledColor(Set<WidgetState> states) {
    if (states.any(_interactiveStates.contains)) {
      return overlayButtonColor;
    } else if (states.contains(WidgetState.disabled)) {
      return isLoading ? loadingButtonColor : disabledButtonColor;
    }
    return buttonColor;
  }

  ButtonStyle _getButtonStyle() {
    return FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: radius.all.round),
      splashFactory: InkRipple.splashFactory,
      minimumSize: _size,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: dimen.x.xs,
    ).merge(
      ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(_getFilledColor),
        side: WidgetStateProperty.resolveWith(_getBorderSide),
      ),
    );
  }

  bool get _hasBorder => borderColor != null;

  bool get _hasDisabledBorderColor => disabledBorderColor != null;

  BorderSide? _getBorderSide(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled) && _hasDisabledBorderColor) {
      return BorderSide(color: disabledBorderColor!);
    }
    return _hasBorder ? BorderSide(color: borderColor!) : BorderSide.none;
  }

  Size get _size {
    switch (buttonType) {
      case ActionButtonSize.blocked:
        return Size(double.infinity, buttonType.height);
      case ActionButtonSize.small:
      case ActionButtonSize.responsive:
        return Size(64, buttonType.height);
    }
  }
}
