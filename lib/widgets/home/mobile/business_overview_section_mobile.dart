import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/utils/routes.dart';

class BusinessOverviewSectionMobile extends StatelessWidget {
  const BusinessOverviewSectionMobile({super.key});

  static const double _horizontalPadding = 16.0;
  static const double _buttonHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundImage(),
        Positioned(
          top: 60,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _text1(),
        ),
        Positioned(
          top: 175,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _text2(),
        ),
        Positioned(
          top: 350,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _button1(context),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 422, left: _horizontalPadding, right: _horizontalPadding),
          child: _button2(context),
        ),
      ],
    );
  }

  SizedBox _backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: 414,
      child: Image.asset(
        ImageUtils.socialMediaBackgroundPath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _text1() {
    return Text(
      'Трансформирайте\nвашия бизнес.',
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorUtils.lightGray,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _text2() {
    return Text(
      'Увеличете продажбите\nс помощта на\nправилно позиционирани\nреĸламни ĸампании.',
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorUtils.lightGray,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _button1(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.connectWithUs);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
              return Colors.grey;
            }

            return ColorUtils.lightGray;
          }),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)
                    ? Colors.grey
                    : ColorUtils.lightGray,
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
                textStyle: const TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
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
    );
  }

  Widget _button2(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.services);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorUtils.lightGray),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(
                color: ColorUtils.lightGray,
                width: 1,
              ),
            );
          }),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Безплатна консултация',
              style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.arrow_forward,
              color: ColorUtils.charcoal,
            ),
          ],
        ),
      ),
    );
  }
}
