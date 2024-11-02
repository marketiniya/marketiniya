import 'package:flutter/material.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/home/business_info_section.dart';
import 'package:marketinya/widgets/home/business_overview_section.dart';
import 'package:marketinya/widgets/home/carousel_section.dart';
import 'package:marketinya/widgets/space_box.dart';
import '../widgets/features_with_images_section.dart';
import '../widgets/home/explore_services_section.dart';
import '../widgets/lime_contact_form.dart';
import '../widgets/subscription_form.dart';

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
