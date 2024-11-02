import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    ImageUtils.carouselItemImage0,
    ImageUtils.carouselItemImage1,
    ImageUtils.carouselItemImage2,
  ];

  @override
  Widget build(BuildContext context) {
    double maxCarouselWidth = 1500.0;

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
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxCarouselWidth),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.75,
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
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
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
                  child: SvgPicture.asset(
                    ImageUtils.previousImagePath,
                    width: 40,
                    height: 72,
                  ),
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
                  child: SvgPicture.asset(ImageUtils.nextImagePath,
                    width: 40,
                    height: 72,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
