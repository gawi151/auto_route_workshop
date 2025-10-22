import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 1: Details Screen
/// This screen demonstrates:
/// - Receiving a pop() back button
/// - Understanding the navigation stack
@RoutePage()
class Lesson1DetailsScreen extends StatelessWidget {
  const Lesson1DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              'Details Screen',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('You navigated here using context.router.push()'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Understand how pop() works
                // Hint: The back button above already does this automatically
              },
              child: const Text('Go Back (Manual)'),
            ),
          ],
        ),
      ),
    );
  }
}
