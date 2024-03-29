import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/our_requests.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';

class RequestsAndInq extends StatefulWidget {
  @override
  _RequestsAndInqState createState() => _RequestsAndInqState();
}

class _RequestsAndInqState extends State<RequestsAndInq> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(60, 60, 60, 1),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
          child:TranslationBase.of(context).locale == 'en'
              ? Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 25,
          )
              : Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),),
      ),
      body: Container(
        height: height,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: height * .03,
          ),

          Center(
            child:  CircleAvatar(
                backgroundImage: AssetImage('assets/images/avater.png'),
                radius: 50,
              ),

          ),
          SizedBox(
            height: height * .03,
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
            padding: EdgeInsets.fromLTRB(10, 45, 10, 0),
            child: Row(
              children: [
                Text(
                  "Developed By",
                  style: TextStyle(
                    color: Color.fromRGBO(41, 41, 41, 1),
                    fontSize: 12,
                    inherit: false,
                  ),
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
        height: MediaQuery.of(context).size.height * 0.07,
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
                fontWeight: FontWeight.bold
                ,fontFamily: "Montserrat",
                fontSize: 24,
                inherit: false),
          ),
        ),
      ),
    );
  }
}
