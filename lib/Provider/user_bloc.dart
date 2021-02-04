
import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';

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

  logout(BuildContext context) async {
    try {
      _isLogin = false;
      _user = null;
      notifyListeners();

      await SharedPreferenceHandler.setUserData(null);
      Navigator.pushAndRemoveUntil(
          context,
          ScaleTransationRoute(
              page: LoginPage()),
          (Route<dynamic> route) => false);

    } catch (e) {
      print("logout error :$e");
    }
  }


}
