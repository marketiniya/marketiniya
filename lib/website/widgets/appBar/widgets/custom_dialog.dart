import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/utils/color_utils.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    required this.onTabTapped,
    required this.currentRoute,
  });

  static const String homeTab = 'Начало';
  static const String blogTab = 'Блог';
  static const String servicesTab = 'Услуги';
  static const String contactTab = 'Свържи се с нас';
  final void Function(int) onTabTapped;
  final String currentRoute;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            const SizedBox(height: sm),
            CustomDialogNavButton(
              isActive: _isTabActive(CustomDialog.homeTab),
              onPressed: () {
                widget.onTabTapped(0);
                Navigator.pop(context);
              },
              label: CustomDialog.homeTab,
            ),
            const SizedBox(height: sm),
            CustomDialogNavButton(
              isActive: _isTabActive(CustomDialog.blogTab),
              onPressed: () {
                widget.onTabTapped(1);
                Navigator.pop(context);
              },
              label: CustomDialog.blogTab,
            ),
            const SizedBox(height: sm),
            CustomDialogNavButton(
              isActive: _isTabActive(CustomDialog.servicesTab),
              onPressed: () {
                widget.onTabTapped(2);
                Navigator.pop(context);
              },
              label: CustomDialog.servicesTab,
            ),
            const SizedBox(height: 56),
            LimeGreenButton(
              label: CustomDialog.contactTab,
              onPressed: () {
                widget.onTabTapped(3);
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isTabActive(String tabName) {
    switch (tabName) {
      case CustomDialog.homeTab:
        return widget.currentRoute.startsWith(Routes.home.path);
      case CustomDialog.blogTab:
        return widget.currentRoute.startsWith(Routes.blog.path);
      case CustomDialog.servicesTab:
        return widget.currentRoute.startsWith(Routes.services.path);
      default:
        return false;
    }
  }
}

class CustomDialogNavButton extends StatefulWidget {
  const CustomDialogNavButton({
    super.key,
    required this.isActive,
    required this.onPressed,
    required this.label,
  });

  final bool isActive;
  final VoidCallback onPressed;
  final String label;

  @override
  State<CustomDialogNavButton> createState() => _CustomDialogNavButtonState();
}

class _CustomDialogNavButtonState extends State<CustomDialogNavButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorUtils.charcoal),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return Colors.grey;
            }
            if (widget.isActive) {
              return ColorUtils.limeGreen;
            } else {
              return ColorUtils.lightGray;
            }
          }),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: states.contains(WidgetState.hovered) ||
                        states.contains(WidgetState.pressed)
                    ? Colors.grey
                    : widget.isActive
                        ? ColorUtils.limeGreen
                        : ColorUtils.lightGray,
                width: 1,
              ),
            );
          }),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class LimeGreenButton extends StatelessWidget {
  const LimeGreenButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorUtils.limeGreen),
          foregroundColor: WidgetStateProperty.all(ColorUtils.charcoal),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
