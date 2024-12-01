import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_mobile.dart';
import 'package:marketinya/widgets/blog/blog_cards_mobile.dart';
import 'package:marketinya/widgets/home/mobile/business_overview_section_mobile.dart';
import 'package:marketinya/widgets/home/mobile/explore_services_section_mobile.dart';
import 'package:marketinya/widgets/footer/footer_mobile.dart';
import 'package:marketinya/widgets/lime_contact_form_mobile.dart';
import 'package:marketinya/widgets/subscription_form_mobile.dart';

class BlogMobileLayout extends StatelessWidget {
  const BlogMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBarMobile(activeTab: 'Блог'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BusinessOverviewSectionMobile(
              text1: 'НОВОСТИ В МАРКЕТИНГА',
              text2: 'Каĸво е необходимо да\nзнаем, за да имаме успешни\nреĸламни ĸампании.',
              isBlog: true,
            ),
            const SizedBox(height: 65),
            Container(
              height: 8,
              width: double.infinity,
              color: Colors.white,
            ),
            const BlogCardsMobile(),
            const ExploreServicesSectionMobile(),
            const LimeContactFormMobile(),
            const SubscriptionFormMobile(),
            const FooterMobile()
          ],
        ),
      ),
    );
  }
}
