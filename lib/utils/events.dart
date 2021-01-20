import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';

class Events {
  static final Map<DateTime, List<NeatCleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      NeatCleanCalendarEvent('Check in',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      NeatCleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      NeatCleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };
}
