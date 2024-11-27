import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_mobile.dart';
import 'package:marketinya/widgets/home/mobile/business_overview_section_mobile.dart';
import 'package:marketinya/widgets/home/mobile/carousel_section_mobile.dart';

import '../../../utils/color_utils.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarMobile(activeTab: 'Начало'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessOverviewSectionMobile(),
            CarouselSectionMobile(),
          ],
        ),
      ),
    );
  }

}
