import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/navigation/auth_notifier.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/navigation/tab_navigation_screen_shell.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/system/auth/login/login_screen.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_editor_screen.dart';
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
      routes: [
        GoRoute(
          path: 'add',
          name: 'addClient',
          pageBuilder: (context, state) {
            void Function(Client)? onClientUpdated;
            if (state.extra != null && state.extra is Map<String, dynamic>) {
              final extra = state.extra! as Map<String, dynamic>;
              if (extra.containsKey('onClientUpdated')) {
                onClientUpdated =
                    extra['onClientUpdated'] as void Function(Client);
              }
            }

            return NoTransitionPage(
              child: ClientEditorScreen(
                onClientUpdated: onClientUpdated ?? ((_) {}),
              ),
            );
          },
        ),
        GoRoute(
          path: 'edit',
          name: 'editClient',
          pageBuilder: (context, state) {
            final extra = state.extra! as Map<String, dynamic>;
            final client = extra['client'] as Client;
            final onClientUpdated =
                extra['onClientUpdated'] as void Function(Client);

            return NoTransitionPage(
              child: ClientEditorScreen(
                client: client,
                onClientUpdated: onClientUpdated,
              ),
            );
          },
        ),
        // Add other system routes here
      ],
    ),
  ],
);

/// Authentication guard for protected routes
String? _authGuard(BuildContext context, GoRouterState state) {
  final isLoginRoute = state.uri.path == Routes.login.path;
  final isSystemRoute = state.uri.path.startsWith('/system');
  final isEditClientRoute = state.uri.path == Routes.editClient.path;

  final isAuthenticated = _authNotifier.isAuthenticated;

  final pathExists = Routes.values.any(
    (route) => route.path == state.uri.path,
  );

  if (!pathExists) {
    return Routes.home.path;
  }

  if (!isAuthenticated && isSystemRoute) {
    return Routes.login.path;
  }

  if (isAuthenticated && isLoginRoute) {
    return Routes.systemHome.path;
  }

  if (isEditClientRoute) {
    if (state.extra == null ||
        state.extra is! Map<String, dynamic> ||
        !(state.extra! as Map<String, dynamic>).containsKey('client')) {
      return Routes.systemHome.path;
    }
  }

  return null;
}
