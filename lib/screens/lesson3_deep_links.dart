import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 3: Deep Linking
/// This screen demonstrates:
/// - Navigating via URL paths instead of direct route pushing
/// - Using navigateNamed() for path-based navigation
/// - Understanding deep links for notifications and app links
@RoutePage()
class Lesson3DeepLinksScreen extends StatefulWidget {
  const Lesson3DeepLinksScreen({super.key});

  @override
  State<Lesson3DeepLinksScreen> createState() => _Lesson3DeepLinksScreenState();
}

class _Lesson3DeepLinksScreenState extends State<Lesson3DeepLinksScreen> {
  late TextEditingController _pathController;

  @override
  void initState() {
    super.initState();
    _pathController = TextEditingController();
  }

  @override
  void dispose() {
    _pathController.dispose();
    super.dispose();
  }

  void _navigateToPath(String path) {
    // TODO: Implement deep link navigation
    // Hint: Use context.router.navigatePath(path) inside try-catch
    // Show SnackBar on error with "Invalid path: $path"
    // Explore: other path related navigation methods
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 3: Deep Linking'), elevation: 0),
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
                    'Navigate via URL Paths',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Instead of pushing routes directly, navigate using path-based URLs. '
                    'This is useful for notifications, app links, and deep linking.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Quick navigation buttons
          Text(
            'Quick Navigation',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: Configure path in app_router.dart and implement navigation
              // Hint: Use context.router.navigateNamed() with the profile path
              _navigateToPath('/lesson3/profile');
            },
            child: const Text('View Profile'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: Configure path in app_router.dart and implement navigation
              // Navigate directly to edit, skipping the profile screen
              _navigateToPath('/lesson3/edit-profile');
            },
            child: const Text('Edit Profile (Direct)'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: Configure path in app_router.dart and implement navigation
              _navigateToPath('/lesson3/app-settings');
            },
            child: const Text('View Settings'),
          ),
          const SizedBox(height: 24),
          // Custom path navigation
          Text('Custom Path', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _pathController,
            decoration: InputDecoration(
              hintText: 'Enter a path (e.g., lesson3/profile)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              _navigateToPath(_pathController.text);
            },
            child: const Text('Navigate to Path'),
          ),
          const SizedBox(height: 24),
          // Available paths reference
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paths to setup',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('/lesson3/intro'), // this page
                const Text('/lesson3/profile'),
                const Text('/lesson3/edit-profile'),
                const Text('/lesson3/app-settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
