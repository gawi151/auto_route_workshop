import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 4: Advanced Patterns
/// This screen demonstrates:
/// - Route guards (authentication, permissions)
/// - Route resolvers (pre-fetch data)
/// - Custom page transitions
@RoutePage()
class Lesson4SettingsScreen extends StatelessWidget {
  const Lesson4SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 4: Advanced Patterns'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Advanced Routing Patterns',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Learn about route guards, resolvers, and custom transitions '
                    'to build more sophisticated navigation flows.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Route Guards',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Guards prevent navigation to certain routes based on conditions '
                    '(e.g., authentication status, user permissions).',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement a guarded route
                      // Try navigating to a protected screen
                      // It should be blocked if not authenticated
                      // Hint: requires update in app_router, guard itself and
                      // some error handling
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Remember to implement guard.'),
                        ),
                      );
                    },
                    child: const Text('Try Protected Route'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Route Resolvers',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Resolvers allow you to fetch data before navigating to a route. '
                    'The route won\'t complete until the resolver finishes.',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // TODO: Implement a async data fetching in guard
                      // Implement guard yourself. Look for fetchData() method.
                      // Explore: ActiveGuardObserver for nicer ui handling
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Remember to implement guard with async action.',
                          ),
                        ),
                      );
                    },
                    child: const Text('Load Data'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Custom Transitions',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Customize page transitions with fade, scale, or custom animations.',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate with custom transition
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Custom transition applied!'),
                        ),
                      );
                    },
                    child: const Text('Custom Transition'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
