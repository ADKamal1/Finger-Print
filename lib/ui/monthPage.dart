import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/utils/eventWidget.dart';
import 'package:provider/provider.dart';

class Calender extends StatefulWidget {
  bool expanded;
  Calender(this.expanded);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Map<DateTime, List<NeatCleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 5):
        [
      NeatCleanCalendarEvent('Check in',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 5):
        [
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

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc auth = Provider.of<AuthenticationBloc>(context);
    auth.user.userData;
    CalenderBloc calenderBloc = Provider.of<CalenderBloc>(context);

    return ListView(
      children: [
        Calendar(
          hideArrows: false,
          startOnMonday: true,
          weekDays: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
          events: events,
          onDateSelected: (date) {
            FocusScope.of(context).requestFocus(new FocusNode());
            calenderBloc.getCalenderData(
                email: auth.user.userData.email,
                dateTime: date,
                context: context,
                password: auth.user.userData.code);
            print("${date}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          },
          isExpandable: true,
          isExpanded: widget.expanded,
          eventDoneColor: Color.fromRGBO(36, 200, 139, 1),
          selectedColor: Colors.transparent.withOpacity(0.3),
          todayColor: Colors.blueAccent,
          eventListBuilder: (BuildContext context,
              List<NeatCleanCalendarEvent> _selectesdEvents) {
            return Column(
              children: _selectesdEvents
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            EventWidget(
                              title: 'Check in',
                              color: Color.fromRGBO(36, 200, 139, 1),
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Color.fromRGBO(36, 200, 139, 1),
                              ),
                              dateFormatted:
                                  '${DateFormat.jm().format(e.startTime)}',
                              lineThrough: false,
                            ),
                            EventWidget(
                              title: 'Check out',
                              color: Color.fromRGBO(249, 96, 96, 1),
                              icon: Icon(
                                Icons.check_circle,
                                color: Color.fromRGBO(249, 96, 96, 1),
                              ),
                              dateFormatted:
                                  '${DateFormat.jm().format(e.startTime)}',
                              lineThrough: true,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            );
          },
          hideTodayIcon: true,
          eventColor: Colors.transparent,
          expandableDateFormat: 'EEE, MMM d/yyyy',
          dayOfWeekStyle: TextStyle(
              color: Color.fromRGBO(49, 49, 49, 1),
              fontWeight: FontWeight.w800,
              fontSize: 11),
        ),
      ],
    );
  }
}
