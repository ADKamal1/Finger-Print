import 'package:flutter/material.dart';
import 'package:my_finger_printer/models/CheckOut.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class CheckOutBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  CheckOut checkOut;

  userCheckOut(
      {DateTime date, String lat, String lon, BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      checkOut = await Api()
          .checkOut(date: date, lat: lat, lon: lon, context: context);
      dismissWaiting();
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
