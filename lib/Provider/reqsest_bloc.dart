import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/request.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';

import 'general_bloc.dart';

class Request_Bloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Request request;



  RequestService(String email, String password, String massage, String type,
      BuildContext context) async {
    try {
      setWaiting();
      notifyListeners();
      request = await Api().Requests(
          email: email, password: password, massage: massage, type: type);
      dismissWaiting();
      notifyListeners();
      print("hhh:${request.errors}");
      if (request.errors.isEmpty) {
        Navigator.push(context, ScaleTransationRoute(page: HomePage()));
      }
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("request error :$e");
    }
  }
}
