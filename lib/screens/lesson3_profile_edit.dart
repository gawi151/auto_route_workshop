import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/models.dart';

/// Lesson 3: Profile Edit Screen
/// This screen demonstrates:
/// - Nested navigation within a tab
/// - Back button maintaining the stack
@RoutePage()
class Lesson3ProfileEditScreen extends StatefulWidget {
  const Lesson3ProfileEditScreen({super.key});

  @override
  State<Lesson3ProfileEditScreen> createState() =>
      _Lesson3ProfileEditScreenState();
}

class _Lesson3ProfileEditScreenState extends State<Lesson3ProfileEditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: User.currentUser.name);
    _bioController = TextEditingController(text: User.currentUser.bio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Name'),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 24),
          const Text('Bio'),
          const SizedBox(height: 8),
          TextField(
            controller: _bioController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Tell us about yourself',
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Profile updated!')));
              // TODO: Pop back to the profile screen
              // The back button above should do this automatically
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
