import 'package:flutter/material.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/home/business_overview_section.dart';
import 'package:marketinya/widgets/home/carousel_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(activeTab: 'Начало'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessOverviewSection(),
            CarouselSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
