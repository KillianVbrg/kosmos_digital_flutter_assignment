import 'package:assignment/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class PostService{
  static final postRef = FirebaseFirestore.instance
                          .collection("post")
                          .withConverter(
                            fromFirestore: Post.fromFirestore,
                            toFirestore: (Post post, _) => post.toFirestore()
                          );

  // add
  static Future<void> addPost(Post post) async {
    await postRef.doc(uuid.v4()).set(post);
  }

  // get
  static Future<QuerySnapshot<Post>> getPosts(){
    return postRef.get();
  }
}