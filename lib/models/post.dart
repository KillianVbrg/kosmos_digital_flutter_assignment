import 'package:assignment/models/user.dart';

class Post {
  const Post({ required this.image, required this.description, required this.date, required this.user });

  final String image;
  final String description;
  final DateTime date;
  final User user;
}