import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/website/pages/connect_with_us/connect_with_us_screen.dart';
import 'package:marketinya/website/pages/home/home_screen.dart';
import 'package:marketinya/website/pages/services/service_screen.dart';
import 'package:marketinya/website/screens/blog/blog_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: GoRouterPaths.home.path,
  routes: [
    ShellRoute(
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
          path:GoRouterPaths.services.path,
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
  ],
);
