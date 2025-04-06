import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/appBar/custom_app_bar_mobile.dart';
import 'package:marketinya/website/widgets/common/lime_contact_form_mobile.dart';
import 'package:marketinya/website/widgets/common/subscription_form_mobile.dart';
import 'package:marketinya/website/widgets/footer/footer_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/business_info_section.dart';
import 'package:marketinya/website/widgets/home/mobile/explore_services_section_mobile.dart';

class ConnectWithUsMobileLayout extends StatelessWidget {
  const ConnectWithUsMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarMobile(activeTab: 'Свържи се с нас'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LimeContactFormMobile(),
            ExploreServicesSectionMobile(),
            BusinessInfoSectionMobile(),
            SubscriptionFormMobile(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}