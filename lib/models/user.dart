enum Role { USER, ADMIN }

class User {
  const User({required this.id, required this.firstName, required this.lastName, required this.email, required this.password, required this.datePasswordUpdate, required this.image});

  final String id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final DateTime datePasswordUpdate;
  final String? image;
}