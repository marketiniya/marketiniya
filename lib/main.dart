import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketinya/core/config/firebase_options.dart';
import 'package:marketinya/core/navigation/route_guard.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/website/widgets/custom_theme.dart';

import 'core/config/service_locator.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Initialize Flutter bindings first
  WidgetsFlutterBinding.ensureInitialized();

  // Set URL strategy for web
  setPathUrlStrategy();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize dependency injection
  await initializeDependencyInjection();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
      onGenerateRoute: RouteGuard.generateRoute,
    );
  }
}
