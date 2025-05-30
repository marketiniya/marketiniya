import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/website/widgets/services/mobile/service_card_mobile.dart';

class ServicesListMobile extends StatelessWidget {
  const ServicesListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.limeGreen,
      child: const Padding(
        padding: EdgeInsets.only(top: 32, bottom: 32),
        child: Column(
          children: [
            ServiceCardMobile(
              title: 'Маркетинг в\nСоциалните\nМрежи\n',
              imagePath: ImageUtils.carouselImage1noText,
            ),
            SizedBox(height: 24),
            ServiceCardMobile(
              title: 'Разработка на\nУебсайт и\nМобилни\nПриложения',
              imagePath: ImageUtils.carouselImage0noText,
            ),
            SizedBox(height: 24),
            ServiceCardMobile(
              title: 'SEO\n\n\n',
              imagePath: ImageUtils.carouselImage2noText,
            ),
          ],
        ),
      ),
    );
  }
}
