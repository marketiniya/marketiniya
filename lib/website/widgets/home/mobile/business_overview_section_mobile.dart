import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/website/widgets/common/custom_elevated_button.dart';

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
        const BusinessOverviewBackgroundImage(),
        Positioned(
          top: isBlog ? 50 : 60,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: BusinessOverviewCustomText(text:text1, fontSize: isBlog ? 30 : 26),
        ),
        Positioned(
          top: isBlog ? 130 : 175,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: BusinessOverviewCustomText(text:text2, fontSize: isBlog ? 20 : 22),
        ),
        Positioned(
          top: isBlog ? 280 : 350,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: BusinessOverviewElevatedButton(
            text: 'Разгледайте услугите ни',
            onPressed: (context) => context.go(Routes.services.path),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isBlog ? 355 : 422,
            left: _horizontalPadding,
            right: _horizontalPadding,
          ),
          child: BusinessOverviewElevatedButton(
            text: 'Безплатна консултация',
            onPressed: (context) => context.go(Routes.connectWithUs.path),
          ),
        ),
      ],
    );
  }
}

class BusinessOverviewElevatedButton extends StatelessWidget {
  const BusinessOverviewElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 20,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.isFilled = false,
  });

  final String text;
  final void Function(BuildContext) onPressed;
  final double fontSize;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: text,
      fontSize: fontSize,
      onPressed: () => onPressed(context),
      borderColor: ColorUtils.lightGray,
      textColor: ColorUtils.charcoal,
      iconColor: ColorUtils.charcoal,
      isFilled: isFilled,
    );
  }
}

class BusinessOverviewCustomText extends StatelessWidget {
  const BusinessOverviewCustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = ColorUtils.lightGray,
    this.fontWeight = FontWeight.w400,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class BusinessOverviewBackgroundImage extends StatelessWidget {
  const BusinessOverviewBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 414,
      child: Image.asset(
        ImageUtils.socialMediaBackgroundPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
