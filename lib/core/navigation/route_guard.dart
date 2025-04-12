import 'package:flutter/material.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/system/screens/home/home_screen.dart' as system;
import 'package:marketinya/website/pages/home/home_screen.dart' as website;
import 'package:marketinya/system/auth/login/login_screen.dart';
import 'package:marketinya/website/pages/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/pages/services/service_screen.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';

class RouteGuard {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final authRepo = getIt<AuthenticationRepository>();

    // Handle authentication-dependent routes
    if (settings.name == Routes.login || settings.name == Routes.systemHome) {
      return _buildAuthRoute(settings, authRepo);
    }

    // Handle public routes
    return _buildPublicRoute(settings);
  }

  static Route<dynamic> _buildAuthRoute(
      RouteSettings settings, AuthenticationRepository authRepo) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return StreamBuilder<Authentication>(
          stream: authRepo.status,
          builder: (context, snapshot) {
            final isAuthenticated = snapshot.hasData &&
                snapshot.data == Authentication.authenticated;
            final isLoginRoute = settings.name == Routes.login;

            // If authenticated and trying to access login, redirect to system home
            if (isAuthenticated && isLoginRoute) {
              return _RedirectToSystemHome(settings: settings);
            }

            // If not authenticated and trying to access system home, redirect to login
            if (!isAuthenticated && !isLoginRoute) {
              return _RedirectToLogin(settings: settings);
            }

            // Return appropriate screen based on route
            return isLoginRoute
                ? const LoginScreen()
                : const system.HomeScreen();
          },
        );
      },
    );
  }

  static Route<dynamic> _buildPublicRoute(RouteSettings settings) {
    Widget? screen;
    switch (settings.name) {
      case Routes.blog:
        screen = const BlogScreen();
        break;
      case Routes.services:
        screen = const ServiceScreen();
        break;
      case Routes.connectWithUs:
        screen = const ConnectWithUsScreen();
        break;
      case Routes.home:
      default:
        screen = const website.HomeScreen();
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => screen!,
    );
  }
}

class _RedirectToSystemHome extends StatefulWidget {
  final RouteSettings settings;

  const _RedirectToSystemHome({required this.settings});

  @override
  State<_RedirectToSystemHome> createState() => _RedirectToSystemHomeState();
}

class _RedirectToSystemHomeState extends State<_RedirectToSystemHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            settings: const RouteSettings(name: Routes.systemHome),
            builder: (context) => const system.HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const system.HomeScreen();
  }
}

class _RedirectToLogin extends StatefulWidget {
  final RouteSettings settings;

  const _RedirectToLogin({required this.settings});

  @override
  State<_RedirectToLogin> createState() => _RedirectToLoginState();
}

class _RedirectToLoginState extends State<_RedirectToLogin> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            settings: const RouteSettings(name: Routes.login),
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
