import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/molecules/error_state/error_state_view.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/navigation/auth_notifier.dart';
import 'package:marketinya/core/navigation/tab_navigation_screen_shell.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/system/auth/login/login_screen.dart';
import 'package:marketinya/system/screens/system_layout.dart';
import 'package:marketinya/website/pages/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/pages/home/home_screen.dart';
import 'package:marketinya/website/pages/services/service_screen.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';

// Create an AuthNotifier to listen to authentication changes
final _authNotifier = AuthNotifier(getIt<AuthenticationRepository>());

final GoRouter router = GoRouter(
  initialLocation: GoRouterPaths.home.path,
  refreshListenable: _authNotifier, // Listen to auth changes
  redirect: _authGuard,

  // Add error handler for non-existent routes
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
          onRetry: () => context.go(GoRouterPaths.home.path),
          actionLabel: 'Go to Home',
        ),
      ),
    );
  },

  routes: [
    // Public routes with tab navigation shell
    ShellRoute(
      builder: (context, state, child) {
        return TabNavigationScreen(child: child);
      },
      routes: [
        GoRoute(
          path: GoRouterPaths.home.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: GoRouterPaths.blog.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: BlogScreen()),
        ),
        GoRoute(
          path: GoRouterPaths.services.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ServiceScreen()),
        ),
        GoRoute(
          path: GoRouterPaths.connectWithUs.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ConnectWithUsScreen()),
        ),
      ],
    ),
    // Authentication routes (no shell)
    GoRoute(
      path: GoRouterPaths.login.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),
    // System routes (no shell)
    GoRoute(
      path: GoRouterPaths.systemHome.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SystemLayout()),
    ),
  ],
);

/// Authentication guard for protected routes
String? _authGuard(BuildContext context, GoRouterState state) {
  final isLoginRoute = state.uri.path == GoRouterPaths.login.path;
  final isSystemRoute = state.uri.path.startsWith(GoRouterPaths.systemHome.path);

  // Only check authentication for login and system routes
  if (!isLoginRoute && !isSystemRoute) {
    return null; // Public routes don't need authentication
  }

  // Get current authentication status from the notifier
  final isAuthenticated = _authNotifier.isAuthenticated;

  // Redirect authenticated users away from login
  if (isAuthenticated && isLoginRoute) {
    return GoRouterPaths.systemHome.path;
  }

  // Redirect unauthenticated users away from system routes
  if (!isAuthenticated && isSystemRoute) {
    return GoRouterPaths.login.path;
  }

  return null; // No redirection needed
}
