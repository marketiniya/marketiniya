import 'package:flutter/material.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';
import '../widgets/blog/check_services_and_free_consultation_section.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        activeTab: 'Блог',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 156, top: 100, bottom: 32),
              child: Text(
                'НОВОСТИ В МАРКЕТИНГА',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 156, bottom: 124),
              child: Text(
                'Каĸво е необходимо да знаем, за да имаме успешни\nреĸламни ĸампании.',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            CheckServicesAndFreeConsultationSection(),
            Footer()
          ],
        ),
      ),
    );
  }
}
