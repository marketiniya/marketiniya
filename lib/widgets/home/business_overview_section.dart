import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';

class BusinessOverviewSection extends StatelessWidget {
  const BusinessOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 110,
          child: Image.asset(ImageUtils.socialMediaBackgroundPath),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _businessPromotionColumn(),
            _pcImageStack(),
          ],
        ),
      ],
    );
  }

  Column _businessPromotionColumn() {
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
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
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
              // Ripple effect when clicked
              overlayColor: ColorUtils.lightGray.withOpacity(0.3),
              // Ripple color
              shadowColor:
              Colors.black.withOpacity(0.2), // Shadow effect on press
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
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
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
                    fontWeight: FontWeight.w400,
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
        Image.asset(
          'assets/pc-image.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 96,
          left: 243,
          child: Image.asset(
            'assets/desktop-image.png',
            width: 457,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
