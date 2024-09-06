import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketinya/config/firebase_options.dart';
import 'package:marketinya/screens/home_screen.dart';
import 'package:marketinya/widgets/custom_theme.dart';

void main() async{

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.customThemeData,
      home: const HomeScreen(),
    );
  }
}
