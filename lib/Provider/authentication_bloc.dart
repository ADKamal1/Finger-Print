import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';

import 'general_bloc.dart';
import '../widgets/general.dart';

class AuthenticationBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  User user;

  loginService(String email, String password, String serial,
      BuildContext context) async {
    try {
      setWaiting();
      notifyListeners();
      user = await Api().login(email: email, password: password, serial: serial);
      dismissWaiting();
      notifyListeners();
      print("hhh:${user.errors}");
      if (user.errors.isEmpty) {
        Navigator.push(context, ScaleTransationRoute(page: HomePage()));
        SharedPreferenceHandler.setUserData(user);
      }
      else{
        General.showDialogue(
            txtWidget: Text(user.errors[0]),
            context: context);
      }
//      SharedPreferenceHandler.setUserData(user);
      //SharedPreferenceHandler.setUserSerial(user);
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("login Error :$e");
    }
  }
}
