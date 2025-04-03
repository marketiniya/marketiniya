import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/routes.dart';

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
            const SizedBox(height: 24),
            _navButton(context, activeTab, 'Начало', Routes.home),
            const SizedBox(height: 24),
            _navButton(context, activeTab, 'Блог', Routes.blog),
            const SizedBox(height: 24),
            _navButton(context, activeTab, 'Услуги', Routes.services),
            const SizedBox(height: 56),
            _limeGreenButton(context, 'Свържи се с нас', Routes.connectWithUs),
            const Spacer(),
            _backButton(context),
          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String activeTab, String label, String routeName) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorUtils.charcoal),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
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
                color: states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)
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

  Widget _limeGreenButton(BuildContext context, String label, String routeName) {
    return SizedBox(
      width: 328,
      height: 55,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
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

  IconButton _backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_upward,
        color: Colors.grey.shade700,
      ),
    );
  }
}
