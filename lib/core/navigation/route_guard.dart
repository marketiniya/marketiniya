import 'package:flutter/material.dart';

import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/system/auth/login/login_screen.dart';
import 'package:marketinya/system/screens/system_layout.dart' as system;
import 'package:marketinya/website/pages/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/pages/home/home_screen.dart' as website;
import 'package:marketinya/website/pages/services/service_screen.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';

/// A route guard that handles navigation and authentication in the application.
/// It manages both authenticated and public routes, ensuring proper access control.
class RouteGuard {
  /// Generates the appropriate route based on the route settings and authentication status.
  ///
  /// This method is called by the MaterialApp's onGenerateRoute to handle all navigation.
  /// It determines whether to use authenticated or public routes based on the route name.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final authRepo = getIt<AuthenticationRepository>();

    // Handle routes that require authentication check
    if (settings.name == Routes.login || settings.name == Routes.systemHome) {
      return _buildAuthRoute(settings, authRepo);
    }

    // Handle public routes that don't require authentication
    return _buildPublicRoute(settings);
  }

  /// Builds a route that requires authentication check.
  ///
  /// This method handles routes that need to verify the user's authentication status:
  /// - Login route: Redirects to system home if already authenticated
  /// - System home route: Redirects to login if not authenticated
  static Route<dynamic> _buildAuthRoute(
    RouteSettings settings,
    AuthenticationRepository authRepo,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => StreamBuilder<Authentication>(
        stream: authRepo.status,
        builder: (context, snapshot) {
          final isAuthenticated =
              snapshot.hasData && snapshot.data == Authentication.authenticated;
          final isLoginRoute = settings.name == Routes.login;

          // Redirect authenticated users away from login screen
          if (isAuthenticated && isLoginRoute) {
            return _RedirectToSystemHome(settings: settings);
          }

          // Redirect unauthenticated users away from system home
          if (!isAuthenticated && !isLoginRoute) {
            return _RedirectToLogin(settings: settings);
          }

          // Show the appropriate screen based on authentication status
          return isLoginRoute
              ? const LoginScreen()
              : const system.SystemLayout();
        },
      ),
    );
  }

  /// Builds a public route that doesn't require authentication.
  ///
  /// This method handles all public routes in the application:
  /// - Blog
  /// - Services
  /// - Connect with Us
  /// - Website Home
  static Route<dynamic> _buildPublicRoute(RouteSettings settings) {
    final screen = switch (settings.name) {
      Routes.blog => const BlogScreen(),
      Routes.services => const ServiceScreen(),
      Routes.connectWithUs => const ConnectWithUsScreen(),
      Routes.home => const website.HomeScreen(),
      _ => const website
          .HomeScreen(), // Default to website home for unknown routes
    };

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => screen,
    );
  }
}

/// A widget that handles redirection to the system home screen.
///
/// This widget is used to redirect authenticated users from the login screen
/// to the system home screen. It uses post-frame callback to ensure proper
/// navigation timing.
class _RedirectToSystemHome extends StatefulWidget {
  const _RedirectToSystemHome({required this.settings});

  final RouteSettings settings;

  @override
  State<_RedirectToSystemHome> createState() => _RedirectToSystemHomeState();
}

class _RedirectToSystemHomeState extends State<_RedirectToSystemHome> {
  @override
  void initState() {
    super.initState();
    // Use post-frame callback to ensure navigation happens after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.pushReplacement(
          const system.SystemLayout(),
          routeName: Routes.systemHome,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => const system.SystemLayout();
}

/// A widget that handles redirection to the login screen.
///
/// This widget is used to redirect unauthenticated users from protected routes
/// to the login screen. It uses post-frame callback to ensure proper
/// navigation timing.
class _RedirectToLogin extends StatefulWidget {
  const _RedirectToLogin({required this.settings});

  final RouteSettings settings;

  @override
  State<_RedirectToLogin> createState() => _RedirectToLoginState();
}

class _RedirectToLoginState extends State<_RedirectToLogin> {
  @override
  void initState() {
    super.initState();
    // Use post-frame callback to ensure navigation happens after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.pushReplacement(
          const LoginScreen(),
          routeName: Routes.login,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => const LoginScreen();
}
