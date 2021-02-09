import 'package:flutter/material.dart';
import 'package:my_finger_printer/models/Status.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class Status_Bloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Status status;

  statusService(String email, String password, String serial,
      BuildContext context) async {
    try {
      setWaiting();
      notifyListeners();
      status =
          await Api().status(email: email, password: password, serial: serial);
      dismissWaiting();
      notifyListeners();
      print("hhh:${status.errors}");
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("request error :$e");
    }
  }
}
