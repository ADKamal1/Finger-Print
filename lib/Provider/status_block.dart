import 'package:flutter/material.dart';
import 'package:my_finger_printer/models/Status.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class StatusBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Status status;

  getUserState() async {
    try {
      setWaiting();
      notifyListeners();
      status = await Api().getUserStatus();
      dismissWaiting();
      notifyListeners();
      print("\nstatueError:${status.errors}");
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("request error :$e");
    }
  }
}
