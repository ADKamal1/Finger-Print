import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/ui/monthPage.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:provider/provider.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalenderBloc calenderBloc =
        Provider.of<CalenderBloc>(context, listen: true);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Color.fromRGBO(60, 60, 60, 1),
            toolbarHeight: MediaQuery.of(context).size.height * 0.13,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4),
              tabs: [
                Tab(
                  child: Text(
                    TranslationBase.of(context).getStringLocaledByKey('Day'),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,fontFamily: "Montserrat",),
                  ),
                ),
                Tab(
                  child: Text(
                      TranslationBase.of(context)
                          .getStringLocaledByKey('Month'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18,fontFamily: "Montserrat",)),
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
