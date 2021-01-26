
import 'package:flutter/material.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';

import 'bloc_state.dart';

class UserBloc extends GeneralBlocState {
  bool waiting = true;
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  User _user;

  User get user => _user;
  setUser({User currentUser}) {
    _user = currentUser;
    _isLogin = true;
    notifyListeners();
  }

//  logout(BuildContext context) async {
//    try {
//      _isLogin = false;
//      _user = null;
//      notifyListeners();
//
//      await SharedPreferenceHandler.setUserData(null);
//      Navigator.pushAndRemoveUntil(
//          context,
//          ScaleTransationRoute(
//              page: TabsScreen(
//            tabIndex: 0,
//          )),
//          (Route<dynamic> route) => false);
//      await Api().logout();
//    } catch (e) {
//      print("logout error :$e");
//    }
//  }

//  getUserData() async {
//    try {
//      setWaiting();
//      _user = await Api().getUserData();
//      dismissWaiting();
//      setError(null);
//    } catch (e) {
//      dismissWatingWithError();
//      setError(e.toString());
//      print("get user error :$e");
//    }
//  }
}
