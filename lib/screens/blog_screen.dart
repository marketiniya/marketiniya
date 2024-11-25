import 'package:flutter/material.dart';
import 'package:marketinya/widgets/appBar/custom_app_bar_desktop.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:marketinya/widgets/lime_contact_form.dart';
import 'package:marketinya/widgets/subscription_form.dart';
import 'package:marketinya/widgets/blog/blog_cards.dart';
import 'package:marketinya/widgets/blog/check_services_and_free_consultation_section.dart';
import 'package:marketinya/widgets/space_box.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarDesktop(
        activeTab: 'Блог',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header1(),
            _header2(),
            const SpaceBox(height: 70, color: Colors.white),
            const BlogCards(),
            const CheckServicesAndFreeConsultationSection(),
            const LimeContactForm(),
            const SubscriptionForm(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Padding _header1() {
    return const Padding(
      padding: EdgeInsets.only(left: 156, top: 100, bottom: 32),
      child: Text(
        'НОВОСТИ В МАРКЕТИНГА',
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Padding _header2() {
    return const Padding(
      padding: EdgeInsets.only(left: 156, bottom: 124),
      child: Text(
        'Каĸво е необходимо да знаем, за да имаме успешни\nреĸламни ĸампании.',
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
