import 'package:assignment/models/user_info.dart';
import 'package:assignment/services/firestore/user_info_service.dart';
import 'package:flutter/material.dart';

class UserInfoStore extends ChangeNotifier {
  late List<UserInfo> _userInfo = [];

  get userInfo => _userInfo;

  // add
  void setUserInfo(UserInfo userInfo){
    UserInfoService.addUserInfo(userInfo);

    _userInfo = [];
    _userInfo.insert(0, userInfo);

    notifyListeners();
  }

  // initial fetch
  void fetchUserInfo(String uid) async {
    if(_userInfo.isEmpty){
      final snapshot = await UserInfoService.getUserInfo(uid);

      for(var doc in snapshot.docs){
        _userInfo.add(doc.data());
      }

      notifyListeners();
    }
  }

  // update
  void updateUserInfo(UserInfo userInfo) async {
    setUserInfo(userInfo);

    UserInfoService.updateUserInfo(userInfo);
  }
}