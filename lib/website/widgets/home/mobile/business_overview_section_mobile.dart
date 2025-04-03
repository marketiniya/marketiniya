import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/website/widgets/custom_elevated_button.dart';

class BusinessOverviewSectionMobile extends StatelessWidget {
  const BusinessOverviewSectionMobile({
    super.key,
    required this.text1,
    required this.text2,
    this.isBlog = false,
  });

  final String text1;
  final String text2;

  final bool isBlog;

  static const double _horizontalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundImage(),
        Positioned(
          top: isBlog ? 50 : 60,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _buildText(text1, fontSize: isBlog ? 30 : 26),
        ),
        Positioned(
          top: isBlog ? 130 : 175,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _buildText(text2, fontSize: isBlog ? 20 : 22),
        ),
        Positioned(
          top: isBlog ? 280 : 350,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: _button1(context),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isBlog ? 355 : 422,
            left: _horizontalPadding,
            right: _horizontalPadding,
          ),
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

  Widget _buildText(String text, {required double fontSize}) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: ColorUtils.lightGray,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _button1(BuildContext context) {
    return CustomElevatedButton(
      text: 'Разгледайте услугите ни',
      fontSize: 20,
      onPressed: () => Navigator.pushNamed(context, Routes.connectWithUs),
      borderColor: ColorUtils.lightGray,
      textColor: ColorUtils.lightGray,
      iconColor: ColorUtils.lightGray,
    );
  }

  Widget _button2(BuildContext context) {
    return CustomElevatedButton(
      text: 'Безплатна консултация',
      fontSize: 20,
      onPressed: () => Navigator.pushNamed(context, Routes.services),
      borderColor: ColorUtils.lightGray,
      textColor: ColorUtils.charcoal,
      iconColor: ColorUtils.charcoal,
      isFilled: true,
    );
  }
}
