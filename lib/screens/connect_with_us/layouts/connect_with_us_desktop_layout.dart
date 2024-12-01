import 'package:flutter/material.dart';
import 'package:marketinya/widgets/check_our_services_section.dart';
import 'package:marketinya/widgets/footer/footer.dart';
import 'package:marketinya/widgets/features_with_images_section.dart';
import 'package:marketinya/widgets/lime_contact_form.dart';
import 'package:marketinya/widgets/subscription_form.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_desktop.dart';

class ConnectWithUsDesktopLayout extends StatelessWidget {
  const ConnectWithUsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarDesktop(activeTab: 'Свържи се с нас'),
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
