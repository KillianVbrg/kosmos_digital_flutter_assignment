import 'package:flutter/material.dart';
import 'package:assignment/models/post.dart';
import 'package:assignment/services/firestore/post_service.dart';

class PostStore extends ChangeNotifier {
  final List<Post> _posts = [];

  get posts => _posts;

  // add
  void addPost(Post post){
    PostService.addPost(post);

    _posts.insert(0, post);

    notifyListeners();
  }

  // initial fetch
  void fetchPosts() async {
    final snapshot = await PostService.getPosts();

    for(var doc in snapshot.docs){
      _posts.add(doc.data());
    }

    notifyListeners();
  }
}