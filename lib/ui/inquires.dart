import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/our_requests.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:statusbar/statusbar.dart';

class RequestsAndInq extends StatefulWidget {
  @override
  _RequestsAndInqState createState() => _RequestsAndInqState();
}

class _RequestsAndInqState extends State<RequestsAndInq> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StatusBar.color(Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        color: Colors.white,
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                  height: height * .17,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(60, 60, 60, 1),
                  )),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 0, top: 45, bottom: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            height: height * 0.15,
          ),
          MyContainer(
              TranslationBase.of(context).getStringLocaledByKey('leave'),
              30,
              Color.fromRGBO(40, 40, 40, 1),
              "Leave"),
          SizedBox(
            height: height * 0.03,
          ),
          MyContainer(TranslationBase.of(context).getStringLocaledByKey('loan'),
              30, Color.fromRGBO(40, 40, 40, 1), "Loan"),
          SizedBox(
            height: height * 0.03,
          ),
          MyContainer(
              TranslationBase.of(context).getStringLocaledByKey('salary'),
              30,
              Color.fromRGBO(40, 40, 40, 1),
              "Salary"),
          SizedBox(
            height: height * 0.03,
          ),
          MyContainer(TranslationBase.of(context).getStringLocaledByKey('FAQ'),
              30, Color.fromRGBO(40, 40, 40, 1), "FAQ"),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 45, 0, 0),
            child: Row(
              children: [
                Text(
                  "Developed By",
                  style: TextStyle(
                      color: Color.fromRGBO(41, 41, 41, 1),
                      fontSize: 12,
                      inherit: false),
                ),
                Container(
                  child: Image.asset(
                    "assets/images/component.png",
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String data;
  final String type;

  final double radius;
  final Color color;

  MyContainer(this.data, this.radius, this.color, this.type);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OurRequests(
                      type: type,
                    )));
      },
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
