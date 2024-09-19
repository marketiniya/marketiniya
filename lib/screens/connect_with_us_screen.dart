import 'package:flutter/material.dart';
import 'package:marketinya/widgets/check_our_services_section.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/features_with_images_section.dart';
import 'package:marketinya/widgets/lime_contact_form.dart';
import 'package:marketinya/widgets/subscription_form.dart';

import '../widgets/custom_app_bar.dart';

class ConnectWithUsScreen extends StatelessWidget {
  const ConnectWithUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(activeTab: 'Свържи се с нас'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LimeContactForm(hasLimeBackground: false),
            CheckOurServicesSection(),
            SizedBox(height: 72),
            FeaturesWithImagesSection(),
            SubscriptionForm(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
