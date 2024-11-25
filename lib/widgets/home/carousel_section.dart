import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final _carouselController = CarouselSliderController();

  final List<String> images = [
    ImageUtils.carouselItemImage2,
    ImageUtils.carouselItemImage1,
    ImageUtils.carouselItemImage0,
  ];

  final List<String> captions = [
    'SEO',
    'Маркетинг в\nСоциалните Мрежи',
    'Разработка на\nУебсайт и Мобилни\nПриложения',
  ];

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 72),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 600,
                    autoPlay: false,
                    enableInfiniteScroll: true,
                    initialPage: 1,
                    enlargeCenterPage: true,
                    viewportFraction: 0.3,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 13,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Text(
                              captions[index],
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Positioned(
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: SvgPicture.asset(ImageUtils.previousImagePath),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: SvgPicture.asset(ImageUtils.nextImagePath),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
