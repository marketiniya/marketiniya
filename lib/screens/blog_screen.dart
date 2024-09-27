import 'package:flutter/material.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        activeTab: 'Блог',
      ),
      body: Center(
        child: Text('Blog TEST2'),
      ),
    );
  }
}
