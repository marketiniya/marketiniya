import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/routes.dart';

class ExploreServicesSectionMobile extends StatelessWidget {
  const ExploreServicesSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.connectWithUs);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorUtils.charcoal),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered) ||
                    states.contains(WidgetState.pressed)) {
                  return Colors.grey;
                }

                return ColorUtils.charcoal;
              }),
              shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: states.contains(WidgetState.hovered) ||
                            states.contains(WidgetState.pressed)
                        ? Colors.grey
                        : ColorUtils.charcoal,
                    width: 1,
                  ),
                );
              }),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Разгледайте услугите ни',
                  style: GoogleFonts.roboto(
                    color: ColorUtils.lightGray,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.arrow_forward,
                  color: ColorUtils.lightGray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
