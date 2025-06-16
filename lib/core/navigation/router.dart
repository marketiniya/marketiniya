import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/molecules/error_state/error_state_view.dart';
import 'package:marketinya/core/navigation/auth_notifier.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/tab_navigation_screen_shell.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/system/auth/login/login_screen.dart';
import 'package:marketinya/system/screens/system_layout.dart';
import 'package:marketinya/website/pages/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/pages/home/home_screen.dart';
import 'package:marketinya/website/pages/services/service_screen.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';

final _authNotifier = AuthNotifier(getIt<AuthenticationRepository>());

final GoRouter router = GoRouter(
  initialLocation: Routes.home.path,
  refreshListenable: _authNotifier,
  redirect: _authGuard,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: ErrorStateView(
          title: 'Page Not Found',
          message: 'The page "${state.uri.path}" does not exist.',
          errorIcon: const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          onRetry: () => context.go(Routes.home.path),
          actionLabel: 'Go to Home',
        ),
      ),
    );
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return TabNavigationScreenShell(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: Routes.blog.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: BlogScreen()),
        ),
        GoRoute(
          path: Routes.services.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ServiceScreen()),
        ),
        GoRoute(
          path: Routes.connectWithUs.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ConnectWithUsScreen()),
        ),
      ],
    ),
    GoRoute(
      path: Routes.login.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      path: Routes.systemHome.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SystemLayout()),
    ),
  ],
);

/// Authentication guard for protected routes
String? _authGuard(BuildContext context, GoRouterState state) {
  final isLoginRoute = state.uri.path == Routes.login.path;
  final isSystemRoute = state.uri.path.startsWith(Routes.systemHome.path);

  if (!isLoginRoute && !isSystemRoute) {
    return null; // Public routes don't need authentication
  }

  final isAuthenticated = _authNotifier.isAuthenticated;

  if (isAuthenticated && isLoginRoute) {
    return Routes.systemHome.path;
  }

  if (!isAuthenticated && isSystemRoute) {
    return Routes.login.path;
  }

  return null;
}
