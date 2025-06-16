import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';

class BusinessOverviewSection extends StatelessWidget {
  const BusinessOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Stack(
        children: [
          Positioned.fill(
            top: 110,
            child: Image.asset(ImageUtils.socialMediaBackgroundPath),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _businessPromotionColumn(context),
                _pcImageStack(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _businessPromotionColumn(BuildContext context) {
    const buttonWidth = 318.0;
    const buttonHeight = 60.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _businessTransformationHeader(),
        const Text(
          "Увеличете продажбите с\nпомощта на правилно\nпозиционирани\nреĸламни ĸампании.",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 100),
        SizedBox(
          height: buttonHeight,
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              context.go(Routes.services.path);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtils.charcoal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: ColorUtils.lightGray,
                  width: 1, // Outline width
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              splashFactory: InkRipple.splashFactory,
              overlayColor: ColorUtils.lightGray.withValues(alpha: 0.3),
              shadowColor:
              Colors.black.withValues(alpha: 0.2),
            ),
            child: const Row(
              children: [
                Text(
                  'Разгледайте услугите ни',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.lightGray,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, color: ColorUtils.lightGray),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: buttonHeight,
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              context.go(Routes.connectWithUs.path);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtils.lightGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: const Row(
              children: [
                Text(
                  'Безплатна консултация',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.charcoal,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, color: ColorUtils.charcoal),
              ],
            ),
          ),
        ),
        const SizedBox(height: 163),
        const Text(
          'Какво можем да предложим?',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Padding _businessTransformationHeader() {
    return const Padding(
      padding: EdgeInsets.only(top: 124, bottom: 32),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "Трансформирайте вашия бизнес",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Stack _pcImageStack() {
    return Stack(
      children: [
        Positioned(
          top: 380,
          left: 50,
          child: Image.asset(ImageUtils.laptopShadowImage),
        ),
        Image.asset(ImageUtils.laptopImage, fit: BoxFit.cover),
        Positioned(
          top: 96,
          left: 243,
          child: Image.asset(
            ImageUtils.desktopImage,
            width: 457,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
