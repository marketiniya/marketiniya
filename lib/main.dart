import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketinya/config/firebase_options.dart';
import 'package:marketinya/screens/blog/blog_screen.dart';
import 'package:marketinya/screens/connect_with_us_screen.dart';
import 'package:marketinya/screens/home/home_screen.dart';
import 'package:marketinya/screens/service_screen.dart';
import 'package:marketinya/utils/routes.dart';
import 'package:marketinya/widgets/custom_theme.dart';

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
