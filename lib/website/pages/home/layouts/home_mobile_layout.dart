import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/common/lime_contact_form_mobile.dart';
import 'package:marketinya/website/widgets/common/subscription_form_mobile.dart';
import 'package:marketinya/website/widgets/footer/footer_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/business_info_section.dart';
import 'package:marketinya/website/widgets/home/mobile/business_overview_section_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/carousel_section_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/explore_services_section_mobile.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessOverviewSectionMobile(
              text1: 'Трансформирайте\nвашия бизнес.',
              text2: 'Увеличете продажбите\nс помощта на\nправилно позиционирани\nреĸламни ĸампании.',
            ),
            CarouselSectionMobile(),
            BusinessInfoSectionMobile(),
            ExploreServicesSectionMobile(),
            LimeContactFormMobile(),
            SubscriptionFormMobile(),
            FooterMobile(),
          ],
        ),
      ),
    );
  }
}
