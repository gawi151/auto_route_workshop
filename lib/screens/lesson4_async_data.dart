import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 4: Data Screen (Data Resolver Example)
/// This screen demonstrates:
/// - How fetch data in guard
@RoutePage()
class Lesson4AsyncDataScreen extends StatelessWidget {
  const Lesson4AsyncDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Data Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_open, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text('Data', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('$data'),
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

// Use below function to run in guard

String? data;

Future<void> fetchData(String dataToSet) async {
  await Future.delayed(const Duration(seconds: 2));
  data = dataToSet;
}