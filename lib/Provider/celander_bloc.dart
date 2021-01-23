import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:my_finger_printer/models/Calender.dart';
import 'package:my_finger_printer/models/CheckIn.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class CalenderBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Calender calender;
  List<NeatCleanCalendarEvent> events;
  NeatCleanCalendarEvent neatCleanCalendarEvent;

  getCalenderData({String email,String password,DateTime dateTime,BuildContext context}) async {
    try {
      setWaiting();
      notifyListeners();
      calender = await Api().getCalenderEvents(dateTime:dateTime,password:password, context: context);

      for (int i = 0;i < calender.model.length; i++)
      {

        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day):
    [
    NeatCleanCalendarEvent('Check in',
    startTime: DateTime(DateTime.now().year, DateTime.now().month,
    DateTime.now().day, 10, 0),
    endTime: DateTime(DateTime.now().year, DateTime.now().month,
    DateTime.now().day, 12, 0),
    description: 'A special event',
    color: Colors.blue[700]),
    ];

        neatCleanCalendarEvent = NeatCleanCalendarEvent('Check in',
                startTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, 10, 0),
                endTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, 12, 0),
                description: 'A special event',
                color: Colors.blue[700]);
        events.add(neatCleanCalendarEvent);
      };
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
