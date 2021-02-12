import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/GeneralInfo.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';

import 'general_bloc.dart';

class GeneralInfoBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  GeneralInfo generalInfo;

  getGeneralService({ String massage, String type,BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      generalInfo = await Api().GeneralRule(massage: massage, type: type);
      dismissWaiting();
      notifyListeners();
      print("hhh:${generalInfo.errors}");
      if (generalInfo.errors.isNotEmpty) {
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
