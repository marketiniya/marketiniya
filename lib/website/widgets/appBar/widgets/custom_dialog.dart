import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/utils/color_utils.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.activeTab});

  final String activeTab;

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
              activeTab: activeTab,
              label: 'Начало',
              routeName: Routes.home.path,
            ),
            const SizedBox(height: sm),
            CustomDialogNavButton(
              activeTab: activeTab,
              label: 'Блог',
              routeName: Routes.blog.path,
            ),
            const SizedBox(height: sm),
            CustomDialogNavButton(
              activeTab: activeTab,
              label: 'Услуги',
              routeName: Routes.services.path,
            ),
            const SizedBox(height: 56),
            LimeGreenButton(
              label: 'Свържи се с нас',
              routeName: Routes.connectWithUs.path,
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
}

class CustomDialogNavButton extends StatelessWidget {
  const CustomDialogNavButton({
    super.key,
    required this.activeTab,
    required this.label,
    required this.routeName,
  });

  final String activeTab;
  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: () => context.go(routeName),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorUtils.charcoal),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return Colors.grey;
            }
            if (activeTab == label) {
              return ColorUtils.limeGreen;
            }
            return ColorUtils.lightGray;
          }),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: states.contains(WidgetState.hovered) ||
                        states.contains(WidgetState.pressed)
                    ? Colors.grey
                    : activeTab == label
                        ? ColorUtils.limeGreen
                        : ColorUtils.lightGray,
                width: 1,
              ),
            );
          }),
        ),
        child: Text(
          label,
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
    required this.routeName,
  });

  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: () => context.go(routeName),
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
