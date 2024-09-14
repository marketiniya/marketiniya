import 'package:flutter/material.dart';
import 'package:marketinya/widgets/services/free_consultation_section.dart';
import 'package:marketinya/widgets/services/text_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/services/services_list.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        activeTab: 'Услуги',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextSection(),
            FreeConsultationSection(),
            ServicesList(),
          ],
        ),
      ),
    );
  }
}
