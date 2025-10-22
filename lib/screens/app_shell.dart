import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../router/app_router.dart';

/// App Shell with Bottom Navigation
/// This demonstrates:
/// - Using AutoTabsRouter for managing multiple independent stacks
/// - Bottom navigation with auto_route
/// - Each lesson as a separate tab with its own navigation stack
@RoutePage()
class AppShellScreen extends StatelessWidget {
  const AppShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        // Lesson 1: Basic Routing
        Lesson1ShellRoute(),
        // Lesson 2: Named Routes & Parameters
        Lesson2ShellRoute(),
        // Lesson 3: Nested Routing
        Lesson3ShellRoute(),
        // Lesson 4: Advanced Patterns
        Lesson4ShellRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Auto Route Workshop'),
                Text(
                  'Route: ${context.topRoute.name}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            elevation: 0,
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Lesson 1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Lesson 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Lesson 3',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Lesson 4',
              ),
            ],
          ),
        );
      },
    );
  }
}
