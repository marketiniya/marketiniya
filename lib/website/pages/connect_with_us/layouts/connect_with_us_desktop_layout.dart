import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/website/widgets/common/lime_contact_form.dart';
import 'package:marketinya/website/widgets/common/subscription_form.dart';
import 'package:marketinya/website/widgets/footer/footer.dart';
import 'package:marketinya/website/widgets/home/features_with_images_section.dart';
import 'package:marketinya/website/widgets/services/check_our_services_section.dart';

class ConnectWithUsDesktopLayout extends StatelessWidget {
  const ConnectWithUsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
