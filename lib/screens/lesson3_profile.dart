import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/models.dart';

/// Lesson 3: Nested Routing
/// This screen demonstrates:
/// - Nested navigation stacks
/// - AutoTabsRouter for tab-based navigation
/// - Independent navigation stacks per tab
@RoutePage()
class Lesson3ProfileScreen extends StatelessWidget {
  const Lesson3ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 3: Nested Routing'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      user.avatar,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.bio,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Nested Navigation Example',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const Text(
            'This tab demonstrates nested routing. '
            'Click the buttons below to see nested navigation in action.',
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to ProfileEditScreen (nested within this tab)
              // This screen will have its own back button
            },
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to ProfileSettingsScreen
              // Multiple nested screens should maintain their own stack
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
