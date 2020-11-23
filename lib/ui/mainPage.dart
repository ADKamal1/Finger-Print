import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/accountPage.dart';
import 'package:my_finger_printer/ui/fp_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
        height: kBottomNavigationBarHeight + 15,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  size: 50,
                ),
                (_selectedIndex != index)
                    ? Text(text,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(40, 40, 40, 0.9)))
                    : Container(),
              ],
            ),
            onTap: () => _onTapped(index),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    //var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            // activeIcon: Container(
            //   width: width * 0.25,
            //   height: 40,
            //   child: Image.asset(
            //     'assets/images/ac.png',
            //     fit: BoxFit.contain,
            //   ),
            // ),
            //  backgroundColor: Color.fromRGBO(243, 243, 243, 1),
            title: SizedBox.shrink(),
            icon: _buildIcon(Icons.fingerprint, 'FP', 0),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: _buildIcon(Icons.person, 'Account', 1),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: _buildIcon(Icons.calendar_today, 'Calendar', 2),
            //label: 'Calendar'
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: _buildIcon(Icons.settings, 'Settings', 3),
            // label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        onTap: _onTapped,
      ),
    );
  }
}
