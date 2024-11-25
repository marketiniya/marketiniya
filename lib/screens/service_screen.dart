import 'package:flutter/material.dart';
import 'package:marketinya/widgets/features_with_images_section.dart';
import 'package:marketinya/widgets/subscription_form.dart';
import 'package:marketinya/widgets/services/free_consultation_section.dart';
import 'package:marketinya/widgets/services/text_section.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/services/services_list.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

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
