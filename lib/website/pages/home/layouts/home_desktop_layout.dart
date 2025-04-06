import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/website/widgets/common/lime_contact_form.dart';
import 'package:marketinya/website/widgets/common/space_box.dart';
import 'package:marketinya/website/widgets/common/subscription_form.dart';
import 'package:marketinya/website/widgets/footer/footer.dart';
import 'package:marketinya/website/widgets/home/desktop/business_info_section.dart';
import 'package:marketinya/website/widgets/home/desktop/business_overview_section.dart';
import 'package:marketinya/website/widgets/home/desktop/carousel_section.dart';
import 'package:marketinya/website/widgets/home/desktop/explore_services_section.dart';
import 'package:marketinya/website/widgets/home/features_with_images_section.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarDesktop(activeTab: 'Начало'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessOverviewSection(),
            CarouselSection(),
            SpaceBox(height: 70, color: Colors.white),
            BusinessInfoSection(),
            FeaturesWithImagesSection(),
            ExploreServicesSection(),
            LimeContactForm(),
            SubscriptionForm(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
