import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/accountPage.dart';
import 'package:my_finger_printer/ui/fp_page.dart';

class GeneralRules extends StatefulWidget {
  @override
  _GeneralRulesState createState() => _GeneralRulesState();
}

class _GeneralRulesState extends State<GeneralRules> {
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
  int _selectedIndex = 1;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData),
                Text(text,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(40, 40, 40, 0.9))),
              ],
            ),
            onTap: () => _onTapped(index),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        iconSize: 25,
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(40, 40, 40, 1), size: 30),
        items: [
          BottomNavigationBarItem(
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
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        onTap: _onTapped,
      ),
      body: Container(
        height: height * 0.9,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                  height: height * .15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(60, 60, 60, 1),
                  )),
              Positioned(
                top: height * 0.05,
                left: width * 0.29,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avater.png'),
                  radius: 70,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.1,
          ),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                'Rules & Information',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.9),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String data;
  final double radius;
  final Color color;

  MyContainer(this.data, this.radius, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(228, 228, 228, 1),
              fontWeight: FontWeight.bold,
              fontSize: 24,
              inherit: false),
        ),
      ),
    );
  }
}
