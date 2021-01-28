
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';
import 'package:provider/provider.dart';

class GlobalFunctions {


  static getUserData(context) async {
    UserBloc userBloc = Provider.of<UserBloc>(context, listen: false);
    User userData = await SharedPreferenceHandler.getuserData();
    print('init userData :$userData');
    try {
      bool isLogin = userData != null ? true : false;
      if (isLogin) {
        try {
          userBloc.setUser(currentUser: userData);
        } catch (e) {
          print("user error is :$e");
        }
      } else {
        print("user not login");
      }
    } catch (e) {
      print("user err : $e");
    }
  }

}
