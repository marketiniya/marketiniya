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
    'assets/carousel/image0.png',
    'assets/carousel/image1.png',
    'assets/carousel/image2.png',
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.75,
              autoPlay: false,
              enableInfiniteScroll: false,
              initialPage: 1,
              enlargeCenterPage: true,
              viewportFraction: 0.3,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.asset(images[index]);
            },
          ),
          Positioned(
            left: 120,
            child: GestureDetector(
              onTap: () {
                _carouselController.previousPage();
              },
              child: SvgPicture.asset(
                ImageUtils.previousImagePath,
                width: 40,
                height: 72,
              ),
            ),
          ),
          Positioned(
            right: 120,
            child: GestureDetector(
              onTap: () {
                _carouselController.nextPage();
              },
              child: SvgPicture.asset(
                ImageUtils.nextImagePath,
                width: 40, // Adjust the size as needed
                height: 72,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
