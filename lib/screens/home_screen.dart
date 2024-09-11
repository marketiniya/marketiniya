import 'package:flutter/material.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/home/business_info_section.dart';
import 'package:marketinya/widgets/home/business_overview_section.dart';
import 'package:marketinya/widgets/home/carousel_section.dart';

import '../widgets/home/features_with_images_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(activeTab: 'Начало'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BusinessOverviewSection(),
            const CarouselSection(),
            Container(width: double.infinity, height: 70, color: Colors.white),
            const BusinessInfoSection(),
            const FeaturesWithImagesSection(),
            Container(width: double.infinity, height: 70, color: Colors.white),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
