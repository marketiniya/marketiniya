import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketinya/core/config/environment_config.dart';
import 'package:marketinya/core/config/firebase_options.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/navigation/router.dart';
import 'package:marketinya/core/repositories/vault_repository.dart';
import 'package:marketinya/core/widgets/activity_listener.dart';
import 'package:marketinya/website/widgets/custom_theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Initialize Flutter bindings first
  WidgetsFlutterBinding.ensureInitialized();

  // Set URL strategy for web
  setPathUrlStrategy();

  // Initialize environment configuration
  EnvironmentConfig.initializeEnvironment();

  // Initialize dependency injection first
  await initializeDependencyInjection();

  // Load secrets from vault
  await getIt<VaultRepository>().loadSecrets();

  // Initialize Firebase with environment-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ActivityListener(
      child: MaterialApp.router(
        title: EnvironmentConfig.isProd ? 'Marketiniya' : 'Marketinya - WIP',
        theme: CustomTheme.customThemeData,
        debugShowCheckedModeBanner: EnvironmentConfig.isWip,
        routerConfig: router,
      ),
    );
  }
}
