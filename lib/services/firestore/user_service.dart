import 'package:cloud_firestore/cloud_firestore.dart';

class UserService{
  static final userRef = FirebaseFirestore.instance.collection("user");


}