import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/utils/eventWidget.dart';
import 'package:provider/provider.dart';
import 'package:statusbar/statusbar.dart';

class Calender extends StatefulWidget {
  bool expanded;
  Calender(this.expanded);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  UserBloc userBloc;
  CalenderBloc calenderBloc;
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    StatusBar.color(Colors.black);
    _init();
  }

  _init() async {
    userBloc = Provider.of<UserBloc>(context, listen: false);
    calenderBloc = Provider.of<CalenderBloc>(context, listen: false);
    calenderBloc.getCalenderData(
        email: userBloc.user.userData.email,
        dateTime: now,
        context: context,
        password: userBloc.user.userData.code);
  }




  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Calendar(
          hideArrows: false,
          startOnMonday: true,
          weekDays: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
          events: calenderBloc.events,
          onDateSelected: (date) {
            //FocusScope.of(context).requestFocus(new FocusNode());
            calenderBloc.getCalenderData(
                email: userBloc.user.userData.email,
                dateTime: date,
                context: context,
                password: userBloc.user.userData.code);
            print("${date}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          },
          isExpandable: true,
          isExpanded: widget.expanded,
          eventDoneColor: Color.fromRGBO(36, 200, 139, 1),
          selectedColor: Colors.transparent.withOpacity(0.3),
          todayColor: Colors.blueAccent,
          eventListBuilder: (BuildContext context,
              List<NeatCleanCalendarEvent> _selectesdEvents) {
            return calenderBloc.neatCleanCalendarEventList.isEmpty?
            Center(
              child:Text("No Events",style: TextStyle(color: Colors.red,fontSize: 20),)
            )
                :Column(
              children: calenderBloc.neatCleanCalendarEventList
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
        )
        //: buildCircularProgressIndicator(),
      ],
    );
  }

//  ////- To Build List Of Courses list
//  buildEvents(CalenderBloc state, BuildContext context) {
//    return state.events.isNotEmpty
//        ?
//        : Container(child: Center(child: General.buildTxt(
//      txt: ('THERE_IS_NO_Events'),
//    )),
//    );
//  }

}
