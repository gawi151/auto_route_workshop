import 'package:auto_route/auto_route.dart';

class Lesson4AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: use resolver to allow navigation
    // when isAuthenticated is true or stay where you
    // are. Explore NavigationResolver.

    // bool isAuthenticated = false;
    resolver.next(false);
  }
}
