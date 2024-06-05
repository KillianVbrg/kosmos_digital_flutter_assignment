import 'package:assignment/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  const Post({ required this.id, required this.image, required this.description, required this.date, required this.authorId });

  final String id;
  final String image;
  final String description;
  final DateTime date;
  final String authorId;

  Map<String, dynamic> toFirestore(){
    return {
      "image": image,
      "description": description,
      "date": date,
      "authorId": authorId,
    };
  }

  factory Post.fromFirestore (DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options){
    final data = snapshot.data()!;

    Post post = Post(
      id: snapshot.id,
      image: data["image"],
      description: data["description"],
      date: (data["date"] as Timestamp).toDate(),
      authorId: data["authorId"],
    );

    return post;
  }
}