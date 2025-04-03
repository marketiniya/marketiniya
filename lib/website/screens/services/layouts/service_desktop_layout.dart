import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/features_with_images_section.dart';
import 'package:marketinya/website/widgets/subscription_form.dart';
import 'package:marketinya/website/widgets/services/free_consultation_section.dart';
import 'package:marketinya/website/widgets/services/text_section.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/website/widgets/footer/footer.dart';
import 'package:marketinya/website/widgets/services/services_list.dart';

class ServiceDesktopLayout extends StatelessWidget {
  const ServiceDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBarDesktop(
        activeTab: 'Услуги',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TextSection(),
            const FreeConsultationSection(),
            const ServicesList(),
            _headerWhyAreWeDifferent(),
            const FeaturesWithImagesSection(),
            const SubscriptionForm(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Padding _headerWhyAreWeDifferent() {
    return const Padding(
      padding: EdgeInsets.only(top: 72, bottom: 72),
      child: Text(
        'Какво ни различава от останалите?',
        style: TextStyle(
          fontSize: 52,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
