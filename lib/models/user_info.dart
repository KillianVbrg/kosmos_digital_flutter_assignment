import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  const UserInfo({required this.id, required this.userId, required this.firstName, required this.lastName, required this.datePasswordUpdate, required this.image, required this.notification});

  final String id;
  final String userId;
  final String? firstName;
  final String? lastName;
  final DateTime datePasswordUpdate;
  final String? image;
  final bool notification;

  Map<String, dynamic> toFirestore(){
    return {
      "userId": userId,
      "firstName": firstName,
      "lastName": lastName,
      "datePasswordUpdate": datePasswordUpdate,
      "image": image,
      "notification": notification,
    };
  }

  factory UserInfo.fromFirestore (DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options){
    final data = snapshot.data()!;

    UserInfo userInfo = UserInfo(
      id: snapshot.id,
      userId: data["userId"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      datePasswordUpdate: (data["datePasswordUpdate"] as Timestamp).toDate(),
      image: data["image"],
      notification: data["notification"],
    );

    return userInfo;
  }
}