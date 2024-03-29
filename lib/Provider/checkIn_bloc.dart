import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/status_block.dart';
import 'package:my_finger_printer/models/CheckIn.dart';
import 'package:my_finger_printer/services/api.dart';
import 'package:my_finger_printer/widgets/general.dart';

import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'general_bloc.dart';

class CheckInBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  CheckIn checkIn;
  StatusBloc statusBloc;

  userCheckIn({DateTime date, String lat, String lon, BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      checkIn =
          await Api().checkIn(date: date, lat: lat, lon: lon, context: context);
      dismissWaiting();
      notifyListeners();
      if (checkIn.errors.isNotEmpty) {
        General.showDialogue(
            txtWidget: Text(TranslationBase.of(context).getStringLocaledByKey('UIAC')), context: context);
      }
//      else{
//        await statusBloc.getUserState();
//      }
      setError(null);
    } catch (e) {
      waiting = false;
      notifyListeners();
      setError(e.toString());
      print("login Error :$e");
    }
  }
}
