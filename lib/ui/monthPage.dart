import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/utils/eventWidget.dart';
import 'package:my_finger_printer/utils/events.dart';

class CalenderWidget extends StatelessWidget {
  bool expanded;
  CalenderWidget(this.expanded);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Calendar(
          hideArrows: false,
          startOnMonday: true,
          weekDays: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
          events: Events.events,
          isExpandable: true,
          isExpanded: expanded,
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
