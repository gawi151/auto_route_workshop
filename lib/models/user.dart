/// Lesson 3: Nested routing
/// This model is used in the User Profile lesson to demonstrate
/// how to manage nested navigation stacks
class User {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String bio;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.bio,
  });

  // Mock current user for the workshop
  static User currentUser = User(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatar: '👨‍💼',
    bio: 'Flutter developer and workshop instructor',
  );
}
