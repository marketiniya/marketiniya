import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_mobile.dart';
import 'package:marketinya/widgets/home/mobile/business_info_section.dart';
import 'package:marketinya/widgets/services/free_consultation_section.dart';
import 'package:marketinya/widgets/services/mobile/text_section_mobile.dart';
import 'package:marketinya/widgets/services/services_list_mobile.dart';
import 'package:marketinya/widgets/subscription_form_mobile.dart';
import 'package:marketinya/widgets/footer/footer_mobile.dart';


class ServiceMobileLayout extends StatelessWidget {
  const ServiceMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBarMobile(activeTab: 'Услуги'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextSectionMobile(),
            FreeConsultationSection(),
            ServicesListMobile(),
            BusinessInfoSectionMobile(),
            SubscriptionFormMobile(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
