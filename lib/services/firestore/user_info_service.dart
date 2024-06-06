import 'package:assignment/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class UserInfoService{
  static final userInfoRef = FirebaseFirestore.instance
                          .collection("user_info")
                          .withConverter(
                            fromFirestore: UserInfo.fromFirestore,
                            toFirestore: (UserInfo userInfo, _) => userInfo.toFirestore()
                          );

  // add
  static Future<void> addUserInfo(UserInfo userInfo) async {
    await userInfoRef.doc(userInfo.id).set(userInfo);
  }

  // get
  static Future<QuerySnapshot<UserInfo>> getUserInfo(String uid){
    return userInfoRef.where('userId', isEqualTo: uid).get();
  }


  // update
  static Future<void> updateUserInfo(UserInfo userInfo) async {
    print(userInfo.id);
    await userInfoRef.doc(userInfo.id).update({
      "userId": userInfo.userId,
      "firstName": userInfo.firstName,
      "lastName": userInfo.lastName,
      "datePasswordUpdate": userInfo.datePasswordUpdate,
      "image": userInfo.image,
      "notification": userInfo.notification,
    });
  }
}