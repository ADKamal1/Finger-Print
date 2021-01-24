import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:my_finger_printer/models/Calender.dart';
import 'package:my_finger_printer/services/api.dart';

import 'general_bloc.dart';

class CalenderBloc extends GeneralBloc {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  Calender calender;

  Map<DateTime, List<NeatCleanCalendarEvent>> events;
  //List<NeatCleanCalendarEvent> events;
  NeatCleanCalendarEvent neatCleanCalendarEvent;
  List<NeatCleanCalendarEvent> neatCleanCalendarEventList=[];
  List _selectedEvents;

  getCalenderData(
      {String email,
      String password,
      DateTime dateTime,
      BuildContext context}) async {
    try {
      events={};
      neatCleanCalendarEventList=[];
      setWaiting ( );
      notifyListeners ( );
      calender = await Api ( ).getCalenderEvents ( dateTime: dateTime, password: password, context: context );

      for (int i = 0; i < calender.calenderData.length; i++) {
        neatCleanCalendarEvent = NeatCleanCalendarEvent ( 'Check in',
            startTime: DateTime ( dateTime.year,dateTime.month, dateTime.day, dateTime.hour,
                dateTime.minute ),
            endTime: DateTime ( dateTime.year,
                dateTime.month,
                dateTime.day,
                dateTime.hour,
                dateTime.minute ),
            description: 'A special event',
            color: Colors.blue[700] );

        neatCleanCalendarEventList.add ( neatCleanCalendarEvent );
      }

      events = {DateTime ( dateTime.year, dateTime.month, dateTime.day ): neatCleanCalendarEventList};
      //print("Events in Bloc : ${events.values}");
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
