import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/accountPage.dart';
import 'package:my_finger_printer/ui/fp_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    FPPage(),
    AccountPage(),
    Center(
      child: Text(
        'Index 2: Calender',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 3: Settings',
        style: optionStyle,
      ),
    ),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //var height= MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromRGBO(40, 40, 40, 0.9),
        items: [
          BottomNavigationBarItem(
            title: Text(
              'FP',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            icon: Icon(
              Icons.fingerprint,
              size: 40,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 40,
              color: Colors.black,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            //label: 'Account',
            //backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 40,
              color: Colors.black,
            ),
            title: Text(
              'Calendar',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            //label: 'Calendar'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 40,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey.shade700,
        //selectedItemColor: Colors.white,
        //unselectedItemColor: Colors.grey,
        onTap: _onTapped,
        //fixedColor: Colors.grey,
      ),
    );
  }
}
