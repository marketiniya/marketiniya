import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        activeTab: 'Услуги',
      ),
      body: Center(
        child: Text('Services'),
      ),
    );
  }
}
