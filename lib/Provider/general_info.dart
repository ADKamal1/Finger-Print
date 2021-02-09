import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/GeneralInfo.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';

import 'general_bloc.dart';

class GeneralInfo_Bloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  GeneralInfo generalInfo;

  GeneralServeces(String email, String password, String massage, String type,
      BuildContext context) async {
    try {
      setWaiting();
      notifyListeners();
      print("xxxxxxxxxxxxxxxxx");
      generalInfo = await Api().GeneralRule(
          email: email, password: password, massage: massage, type: type);
      print("yyyyyyyyyyyyyyyyyyy");
      dismissWaiting();
      notifyListeners();
      print("hhh:${generalInfo.errors}");
      if (generalInfo.errors.isEmpty) {
        Navigator.push(context, ScaleTransationRoute(page: HomePage()));
      }
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("general info error :$e");
    }
  }
}
