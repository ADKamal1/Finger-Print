import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/checkOut_bloc.dart';
import 'package:my_finger_printer/ui/fp_page.dart';
import 'package:my_finger_printer/ui/mainCalender.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:provider/provider.dart';

import '../ui/accountPage.dart';
import 'setting-screen/SettingScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<HomePage> {
  static List<Widget> _widgetOptions = <Widget>[
    FPPage(),
    AccountPage(),
    CalenderPage(),
    SettingScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //StatusBar.color(Colors.black);
  }

  void _onTapped(int index) async {
    AnimatedAlign(
            alignment: Alignment.topCenter, duration: Duration(seconds: 2))
        .curve
        .flipped;
    setState(() {
      _selectedIndex = index;
    });
  }

  final _selectedItemColor = Colors.black;
  final _unselectedItemColor = Colors.black;
  final _selectedBgColor = Colors.white;
  final _unselectedBgColor = Color.fromRGBO(243, 243, 243, 1);
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Color _getBgColor(int index) =>
      _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  Color _getItemColor(int index) =>
      _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;
  Widget _buildIcon(IconData iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  iconData,
                ),
                (_selectedIndex != index)
                    ? Text(text,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(40, 40, 40, 0.9),fontFamily: "Montserrat"))
                    : Text(text,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(40, 40, 40, 0.9),fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () => _onTapped(index),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    CheckInBloc checkInBlock = Provider.of<CheckInBloc>(context);
    AuthenticationBloc authenticationBloc =
        Provider.of<AuthenticationBloc>(context);
    //  authenticationBloc.user.userData;
    CheckOutBloc checkOutBlock = Provider.of<CheckOutBloc>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(60, 60, 60, 1),
        elevation: 0.0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.green,
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        elevation: 0.0,
        iconSize: 25,
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(40, 40, 40, 1), size: 25),

        items: [
          BottomNavigationBarItem(
            title: SizedBox(),
            icon: _buildIcon(Icons.fingerprint,
                TranslationBase.of(context).getStringLocaledByKey('FP'), 0),
          ),
          BottomNavigationBarItem(
            title: SizedBox(),
            icon: _buildIcon(
                Icons.person,
                TranslationBase.of(context).getStringLocaledByKey('Account'),
                1),
          ),
          BottomNavigationBarItem(
            title: SizedBox(),
            icon: _buildIcon(
                Icons.calendar_today,
                TranslationBase.of(context).getStringLocaledByKey('Calender'),
                2),
            //label: 'Calendar'
          ),
          BottomNavigationBarItem(
            title: SizedBox(),
            icon: _buildIcon(
                Icons.settings,
                TranslationBase.of(context).getStringLocaledByKey('Settings'), 3),
            // label: 'Settings',
          ),
        ],

        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        onTap: _onTapped,
      ),
    );
  }
}
