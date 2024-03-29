import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';
import 'package:provider/provider.dart';

import '../widgets/general.dart';
import 'general_bloc.dart';

class AuthenticationBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  User user;

  loginService(String email, String password, String serial, BuildContext context) async {
    UserBloc userBloc = Provider.of<UserBloc>(context, listen: false);
    try {
      _isWaiting = true;
      notifyListeners();
      user = await Api().login(email: email, password: password, serial: serial);
      _isWaiting = false;
      notifyListeners();
      if (user.errors.isEmpty) {
        Navigator.pushAndRemoveUntil(
            context,
            ScaleTransationRoute(page: HomePage()),
            (Route<dynamic> route) => false);
        notifyListeners();
        SharedPreferenceHandler.setUserData(user);
        SharedPreferenceHandler.setUserSerial(serial);
        print("hhh:${user.userData.is_located}");
        userBloc.setUser(currentUser: user);
        Navigator.push(context, ScaleTransationRoute(page: HomePage()));
      } else {
        General.showDialogue(
            txtWidget:
                Text(TranslationBase.of(context).getStringLocaledByKey('ivl')),
            context: context);
      }
      notifyListeners();
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("login Error :$e");
    }
  }
}
