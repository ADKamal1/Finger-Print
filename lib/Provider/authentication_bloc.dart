import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/utils/values.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'general_bloc.dart';


class AuthenticationBloc  extends GeneralBloc{
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  User user;


  loginService(String email, String password, BuildContext context) async {
      try {
        setWaiting();
        notifyListeners();
        user = await Api().login(email: email,password: password);
        dismissWaiting();
        notifyListeners();
        print("hhh:${user.errors}");
        if(user.errors.isEmpty)
        {
          Navigator.push(context, ScaleTransationRoute(page: HomePage()));
        }
        setError(null);
      } catch (e) {
        waiting = false;
        notifyListeners();
        setError(e.toString());
        print("login Error :$e");
      }


  }




}


