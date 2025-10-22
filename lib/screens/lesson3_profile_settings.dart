import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

/// Lesson 3: Profile Settings Screen
/// This screen demonstrates:
/// - Another nested screen within the profile tab
/// - Independent stack management
@RoutePage()
class Lesson3ProfileSettingsScreen extends StatefulWidget {
  const Lesson3ProfileSettingsScreen({super.key});

  @override
  State<Lesson3ProfileSettingsScreen> createState() =>
      _Lesson3ProfileSettingsScreenState();
}

class _Lesson3ProfileSettingsScreenState
    extends State<Lesson3ProfileSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() => _darkModeEnabled = value);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings saved!')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Settings'),
            ),
          ),
        ],
      ),
    );
  }
}
