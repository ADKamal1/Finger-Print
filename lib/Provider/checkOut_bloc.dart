import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/status_block.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/models/CheckOut.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/general.dart';

import 'general_bloc.dart';

class CheckOutBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  CheckOut checkOut;
  StatusBloc statusBloc;

  userCheckOut({DateTime date, String lat, String lon, BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      checkOut = await Api().checkOut(date: date, lat: lat, lon: lon, context: context);
      dismissWaiting();
      notifyListeners();
      if (checkOut.errors.isNotEmpty) {
        General.showDialogue(
            txtWidget:
                Text(TranslationBase.of(context).getStringLocaledByKey('CNC')),
            context: context);
      }
//      else{
//        await statusBloc.getUserState();
//      }
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("login Error :$e");
    }
  }
}
