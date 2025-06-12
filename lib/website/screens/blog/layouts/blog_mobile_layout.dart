import 'package:flutter/material.dart';
import 'package:marketinya/website/widgets/blog/blog_cards_mobile.dart';
import 'package:marketinya/website/widgets/common/lime_contact_form_mobile.dart';
import 'package:marketinya/website/widgets/common/subscription_form_mobile.dart';
import 'package:marketinya/website/widgets/footer/footer_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/business_overview_section_mobile.dart';
import 'package:marketinya/website/widgets/home/mobile/explore_services_section_mobile.dart';

class BlogMobileLayout extends StatelessWidget {
  const BlogMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BusinessOverviewSectionMobile(
              text1: 'НОВОСТИ В МАРКЕТИНГА',
              text2:
                  'Каĸво е необходимо да\nзнаем, за да имаме успешни\nреĸламни ĸампании.',
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
            const FooterMobile(),
          ],
        ),
      ),
    );
  }
}
