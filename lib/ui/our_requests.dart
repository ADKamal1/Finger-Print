import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/accountPage.dart';
import 'package:my_finger_printer/ui/fp_page.dart';

class OurRequests extends StatefulWidget {
  @override
  _OurRequestsState createState() => _OurRequestsState();
}

class _OurRequestsState extends State<OurRequests> {
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
        child: ListView(children: [
          (Column(children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                    height: height * 0.15,
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
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: Text(
                "Wright your Request here",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 0.9)),
              ),
            ),
            Card(
              shadowColor: Color.fromRGBO(213, 213, 213, 1),
              borderOnForeground: true,
              elevation: 10,
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(),
                  height: height * 0.48,
                  width: width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: Color.fromRGBO(112, 112, 112, 1),
                      showCursor: true,
                      maxLines: 20,
                      autofocus: false,
                      cursorWidth: 2,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Developed By",
                      style: TextStyle(
                        color: Color.fromRGBO(40, 40, 40, 0.8),
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/component.png",
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 23, 8),
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Send",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.9),
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.send,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]))
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
    return InkWell(
      onTap: () {},
      child: Container(
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
      ),
    );
  }
}
