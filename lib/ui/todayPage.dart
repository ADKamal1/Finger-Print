// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:my_finger_printer/Provider/authentication_bloc.dart';
// import 'package:my_finger_printer/Provider/celander_bloc.dart';
// import 'package:my_finger_printer/utils/eventWidget.dart';
// import 'package:my_finger_printer/utils/events.dart';
// import 'package:provider/provider.dart';
//
// class TodayPage extends StatefulWidget {
//   @override
//   _TodayPageState createState() => _TodayPageState();
// }
//
// class _TodayPageState extends State<TodayPage> {
//   DateTime now = DateTime.now();
//   int selectedDay;
//
//   bool eventExist = true;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CalenderBloc celenderBlock = Provider.of<CalenderBloc>(context);
//
//     AuthenticationBloc auth = Provider.of<AuthenticationBloc>(context);
//     return Column(
//       children: <Widget>[
//         SizedBox(
//           height: 10,
//         ),
//         // jan 2021
//         Center(
//           child: Text(
//             DateFormat(' MMM yyyy').format(now),
//             style: TextStyle(fontSize: 25),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         // Inline date
//         Expanded(
//           flex: 1,
//           child: Container(
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 var afterDay = now.add(Duration(days: index));
//                 selectedDay = selectedDay ?? 0;
//
//                 return Column(
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 60,
//                       child: GestureDetector(
//                         onTap: () {
//                           print(afterDay.toIso8601String());
//                           setState(() {
//                             selectedDay = index;
//                           });
//                         },
//                         child: Card(
//                           elevation: 10,
//                           shadowColor: Colors.black38,
//                           color: selectedDay == index
//                               ? Color.fromRGBO(249, 96, 96, 1)
//                               : Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '${DateFormat('E').format(afterDay)}',
//                                 style: TextStyle(fontWeight: FontWeight.w700),
//                               ),
//                               Text('${afterDay.day}')
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     eventExist
//                         ? Wrap(
//                             children: [
//                               Container(
//                                 height: 5,
//                                 width: 5,
//                                 decoration: BoxDecoration(
//                                     color: Color.fromRGBO(249, 96, 96, 1)),
//                               ),
//                             ],
//                           )
//                         : Container()
//                   ],
//                 );
//               },
//               itemCount: DateTime.now().month,
//               scrollDirection: Axis.horizontal,
//             ),
//           ),
//         ),
//         //                           Events of Day
//         Expanded(
//           flex: 6,
//           child: ListView.builder(
//               itemCount: Events.events.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       EventWidget(
//                         title: 'Check in',
//                         color: Color.fromRGBO(36, 200, 139, 1),
//                         icon: Icon(
//                           Icons.remove_circle_outline,
//                           color: Color.fromRGBO(36, 200, 139, 1),
//                         ),
//                         dateFormatted: "22222",
//                         //          '${DateFormat.jm().format(Events.events[index].startTime)}',
//                         lineThrough: false,
//                       ),
//                       EventWidget(
//                         title: 'Check out',
//                         color: Color.fromRGBO(249, 96, 96, 1),
//                         icon: Icon(
//                           Icons.check_circle,
//                           color: Color.fromRGBO(249, 96, 96, 1),
//                         ),
//                         dateFormatted: "111111"
//                         // '${
//                         //     DateFormat.jm().format(
//                         //     Events.events[index].StaerTime
//                         // )}',
//                         ,
//                         lineThrough: true,
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }
