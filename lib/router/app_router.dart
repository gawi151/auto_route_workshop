import 'package:auto_route/auto_route.dart';
import 'package:auto_route_workshop/models/models.dart';
import 'package:flutter/foundation.dart';
import '../screens/screens.dart';
import '../screens/app_shell.dart';

part 'app_router.gr.dart';

/// Main AppRouter for the workshop
/// This router demonstrates:
/// - Single router for all lessons
/// - Nested routing with AutoTabsRouter
/// - Route organization
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: AppShellRoute.page,
      children: [
        // Lesson 1 Shell - with nested routes
        AutoRoute(
          initial: true,
          page: Lesson1ShellRoute.page,
          children: [
            AutoRoute(initial: true, page: Lesson1HomeRoute.page),
            AutoRoute(page: Lesson1DetailsRoute.page),
          ],
        ),
        // Lesson 2 Shell - type safe routing with object param
        AutoRoute(
          page: Lesson2ShellRoute.page,
          children: [
            AutoRoute(initial: true, page: Lesson2ProductsRoute.page),
            AutoRoute(page: Lesson2ProductDetailRoute.page),
          ],
        ),
        // Lesson 3 Shell - Deep Linking
        AutoRoute(
          page: Lesson3ShellRoute.page,
          // TODO: Add path configuration for deep linking
          // Add it to this path and children
          children: [
            AutoRoute(initial: true, page: Lesson3DeepLinksRoute.page),
            AutoRoute(page: Lesson3ProfileRoute.page),
            AutoRoute(page: Lesson3ProfileEditRoute.page),
            AutoRoute(page: Lesson3ProfileSettingsRoute.page),
          ],
        ),
        // Lesson 4 - Advanced topics
        AutoRoute(
          page: Lesson4ShellRoute.page,
          children: [
            AutoRoute(initial: true, page: Lesson4SettingsRoute.page),
            AutoRoute(page: Lesson4ProtectedRoute.page),
          ],
        ),
      ],
    ),
  ];
}
