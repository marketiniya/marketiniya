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
        SizedBox(
          width: double.infinity,
          height: 414,
          child: Image.asset(
            ImageUtils.socialMediaBackgroundPath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: isBlog ? 50 : 60,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: Text(
            text1,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: ColorUtils.lightGray,
                fontSize: isBlog ? 30 : 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
          top: isBlog ? 130 : 175,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: Text(
            text2,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: ColorUtils.lightGray,
                fontSize: isBlog ? 20 : 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
          top: isBlog ? 280 : 350,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: CustomElevatedButton(
            text: 'Разгледайте услугите ни',
            fontSize: 20,
            onPressed: () => context.go(Routes.connectWithUs.path),
            borderColor: ColorUtils.lightGray,
            textColor: ColorUtils.lightGray,
            iconColor: ColorUtils.lightGray,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: isBlog ? 355 : 422,
            left: _horizontalPadding,
            right: _horizontalPadding,
          ),
          child: CustomElevatedButton(
            text: 'Безплатна консултация',
            fontSize: 20,
            onPressed: () => context.go(Routes.services.path),
            borderColor: ColorUtils.lightGray,
            textColor: ColorUtils.charcoal,
            iconColor: ColorUtils.charcoal,
            isFilled: true,
          ),
        ),
      ],
    );
  }
}
