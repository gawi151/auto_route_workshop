import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 1: Basic Routing Setup
/// This screen demonstrates:
/// - Basic navigation using AutoRoute
/// - push() to navigate to a new screen
/// - pop() to go back to the previous screen
@RoutePage()
class Lesson1HomeScreen extends StatelessWidget {
  const Lesson1HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1: Basic Routing - Find the TODO ✓'),
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
                    'Complete the TODO →',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Check the code for the TODO comment in the "Go to Details" button. '
                    'Implement basic navigation using context.router.push()',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to Lesson1DetailsScreen
                    },
                    child: const Text('Go to Details'),
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
