import 'package:flutter/material.dart';
import 'package:marketinya/widgets/services/service_card1.dart';
import 'package:marketinya/widgets/services/service_card2.dart';
import 'package:marketinya/widgets/services/service_card3.dart';

import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.limeGreen,
      child: const Column(
        children: [
          ServiceCard1(
            imagePath: ImageUtils.carouselImage1noText,
            title: 'Маркетинг в Социалните\nМрежи',
            fontSize: 38,
          ),
          ServiceCard2(
            imagePath: ImageUtils.carouselImage0noText,
            title: 'Разработка на Уебсайт и \nМобилни Приложения',
            fontSize: 38,
          ),
          ServiceCard3(
            imagePath: ImageUtils.carouselImage2noText,
            title: 'SEO',
            fontSize: 44,
          ),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
