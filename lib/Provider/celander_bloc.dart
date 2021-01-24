import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:my_finger_printer/models/Calender.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class CalenderBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Calender calender;

  Map<DateTime, List<NeatCleanCalendarEvent>> _events;
  //List<NeatCleanCalendarEvent> events;
  NeatCleanCalendarEvent neatCleanCalendarEvent;
  List _selectedEvents;

  getCalenderData(
      {String email,
      String password,
      DateTime dateTime,
      BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      calender = await Api().getCalenderEvents(
          dateTime: dateTime, password: password, context: context);

      Future<List<Calender>> getAllEvent() async {
        try {
          print("zzzzzzzzzzzzzz${calender.model}");
        } catch (e) {
          return Future.error(e.toString());
        }
      }

      getAllEvent();
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
