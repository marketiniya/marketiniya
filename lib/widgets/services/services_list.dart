import 'package:flutter/material.dart';
import 'package:marketinya/widgets/services/service_card.dart';

import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.limeGreen,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          SizedBox(height: 50),
          ServiceCard(
            imagePath: ImageUtils.carouselImage1noText,
            title: 'Маркетинг в Социалните Мрежи',
            fontSize: 38,
          ),
          SizedBox(height: 50),
          ServiceCard(
            imagePath: ImageUtils.carouselImage0noText,
            title: 'Разработка на Уебсайт и Мобилни Приложения',
            fontSize: 38,
          ),
          SizedBox(height: 50),
          ServiceCard(
            imagePath: ImageUtils.carouselImage2noText,
            title: 'SEO',
            fontSize: 44,
          ),
        ],
      ),
    );
  }
}
