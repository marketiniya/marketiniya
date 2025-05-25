import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/colors.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/action_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/design_system/themes/marketiniya_colors.dart';
import 'package:marketinya/core/enums/action_button_size.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton._({
    super.key,
    required this.title,
    required this.isLoading,
    required ActionButtonSize buttonType,
    required this.backgroundColor,
    this.icon,
    required this.activeTitleColor,
    this.onPressed,
    required this.overlayButtonColor,
    this.borderColor,
  }) : _buttonType = buttonType;

  factory PrimaryButton.responsive({
    Key? key,
    required String title,
    bool isLoading = false,
    VoidCallback? onPressed,
    Widget? icon,
    Color backgroundColor = AppColors.lightBeige,
    Color activeTitleColor = grey1200,
    Color overlayButtonColor = AppColors.oliveGreenDark,
    Color? borderColor,
  }) =>
      PrimaryButton._(
        key: key,
        title: title,
        isLoading: isLoading,
        buttonType: ActionButtonSize.responsive,
        onPressed: onPressed,
        icon: icon,
        backgroundColor: backgroundColor,
        activeTitleColor: activeTitleColor,
        overlayButtonColor: overlayButtonColor,
        borderColor: borderColor,
      );

  factory PrimaryButton.blocked({
    Key? key,
    required String title,
    bool isLoading = false,
    VoidCallback? onPressed,
    Widget? icon,
    Color activeTitleColor = grey1200,
    Color overlayButtonColor = AppColors.oliveGreenDark,
  }) =>
      PrimaryButton._(
        key: key,
        title: title,
        isLoading: isLoading,
        buttonType: ActionButtonSize.blocked,
        onPressed: onPressed,
        icon: icon,
        backgroundColor: AppColors.lightBeige,
        activeTitleColor: activeTitleColor,
        overlayButtonColor: overlayButtonColor,
      );

  factory PrimaryButton.small({
    Key? key,
    required String title,
    bool isLoading = false,
    VoidCallback? onPressed,
    Widget? icon,
    Color activeTitleColor = grey1200,
    Color overlayButtonColor = AppColors.oliveGreenDark,
  }) =>
      PrimaryButton._(
        key: key,
        title: title,
        isLoading: isLoading,
        buttonType: ActionButtonSize.small,
        onPressed: onPressed,
        icon: icon,
        backgroundColor: AppColors.lightBeige,
        activeTitleColor: activeTitleColor,
        overlayButtonColor: overlayButtonColor,
      );

  final String title;
  final VoidCallback? onPressed;
  final ActionButtonSize _buttonType;
  final bool isLoading;
  final Widget? icon;
  final Color backgroundColor;
  final Color activeTitleColor;
  final Color overlayButtonColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colors = MarketiniyaColors(context);

    return PortalActionButton(
      title: title,
      onPressed: onPressed,
      activeTitleColor: activeTitleColor,
      disabledTitleColor: colors.texts.tertiary,
      isLoading: isLoading,
      loaderColor: colors.icons.inverse,
      buttonType: _buttonType,
      icon: icon,
      loadingButtonColor: colors.backgrounds.brand.withAlpha(Color.getAlphaFromOpacity(tiny)),
      disabledButtonColor: colors.backgrounds.subtle,
      buttonColor: backgroundColor,
      overlayButtonColor: overlayButtonColor,
      borderColor: borderColor,
    );
  }
}

extension ActionButtonSizeExtension on ActionButtonSize {
  double get height {
    switch (this) {
      case ActionButtonSize.small:
        return md;
      case ActionButtonSize.blocked:
      case ActionButtonSize.responsive:
        return xl;
    }
  }
}
