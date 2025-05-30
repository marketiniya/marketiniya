import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';

class CarouselSectionMobile extends StatelessWidget {
  const CarouselSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorUtils.charcoal,
            ColorUtils.limeGreen,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(),
          _buildImageCard(
              'Маркетинг в\nСоциалните Мрежи', ImageUtils.carouselImage1noText,
          ),
          const SizedBox(height: 24),
          _buildImageCard(
            'Разработка на Уебсайт и\nМобилни Приложения',
            ImageUtils.carouselImage0noText,
          ),
          const SizedBox(height: 24),
          _buildImageCard(
            'SEO',
            ImageUtils.carouselImage2noText,
          ),
          const SizedBox(height: 32),
          Container(
            height: 8,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white.withValues(alpha: 1.0),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              title,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Padding _text() {
  return Padding(
    padding: const EdgeInsets.only(top: 28, bottom: 36, left: 16),
    child: Text(
      'Какво можем да\nпредложим?',
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorUtils.lightGray,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
