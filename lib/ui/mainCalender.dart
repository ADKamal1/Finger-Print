import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/ui/monthPage.dart';
import 'package:provider/provider.dart';
import 'package:statusbar/statusbar.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StatusBar.color(Colors.black);

  }

  @override
  Widget build(BuildContext context) {
    CalenderBloc calenderBloc = Provider.of<CalenderBloc>(context, listen: true);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(60, 60, 60, 1),
            toolbarHeight: MediaQuery.of(context).size.height * 0.15,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4),
              tabs: [
                Tab(
                  child: Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text('Month',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: ScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [Calender(false), Calender(true)],
          )
          //: Center(child: buildCircularProgressIndicator()),
          ),
    );
  }
}
