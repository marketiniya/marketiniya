import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketinya/core/config/firebase_options.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';
import 'package:marketinya/website/screens/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/screens/home/home_screen.dart';
import 'package:marketinya/website/screens/services/service_screen.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/website/widgets/custom_theme.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketinya',
      theme: CustomTheme.customThemeData,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.blog: (context) => const BlogScreen(),
        Routes.services: (context) => const ServiceScreen(),
        Routes.connectWithUs: (context) => const ConnectWithUsScreen()
      },
      home: const HomeScreen(),
    );
  }
}
