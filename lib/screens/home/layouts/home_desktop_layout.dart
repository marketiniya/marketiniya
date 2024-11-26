import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/widgets/footer/footer.dart';
import 'package:marketinya/widgets/home/business_info_section.dart';
import 'package:marketinya/widgets/home/business_overview_section.dart';
import 'package:marketinya/widgets/home/carousel_section.dart';
import 'package:marketinya/widgets/space_box.dart';
import 'package:marketinya/widgets/features_with_images_section.dart';
import 'package:marketinya/widgets/home/explore_services_section.dart';
import 'package:marketinya/widgets/lime_contact_form.dart';
import 'package:marketinya/widgets/subscription_form.dart';

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
