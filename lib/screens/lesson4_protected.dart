import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 4: Protected Screen (Route Guard Example)
/// This screen demonstrates:
/// - How route guards work
/// - What happens when a guard prevents navigation
@RoutePage()
class Lesson4ProtectedScreen extends StatelessWidget {
  const Lesson4ProtectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Protected Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_open, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              'Protected Content',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('You passed the guard check!'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.router.pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
