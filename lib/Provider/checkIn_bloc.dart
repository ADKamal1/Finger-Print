import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/models/CheckIn.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/utils/values.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'general_bloc.dart';


class CheckInBloc  extends GeneralBloc{
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  CheckIn checkIn;


  userCheckIn({DateTime date, String lat,String lon ,BuildContext context}) async {
      try {
        setWaiting();
        notifyListeners();
        checkIn = await Api().checkIn(date: date,lat: lat,lon: lon,);
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


