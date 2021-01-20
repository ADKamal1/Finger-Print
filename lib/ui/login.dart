import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 50, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(49, 49, 49, 1)),
          ),
          (!isPassword)
              ? TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      hintText: '10001',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(198, 198, 198, 1),
                          fontSize: 16),
                      fillColor: Colors.white10,
                      filled: true),
                  cursorColor: Color.fromRGBO(237, 237, 237, 1),
                )
              : TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(198, 198, 198, 1),
                          fontSize: 16),
                      fillColor: Colors.white10,
                      filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromRGBO(40, 40, 40, 1),
      ),
      child: Text(
        "Log In",
        textAlign: TextAlign.center,
        style:
            TextStyle(color: Color.fromRGBO(255, 255, 2555, 1), fontSize: 18),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Welcome back',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 32, color: Color.fromRGBO(49, 49, 49, 1)),
    );
  }

  Widget _subtitle() {
    return Text(
      'Sign in to continue',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16, color: Color.fromRGBO(155, 155, 155, 1)),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Employee ID"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            left: 10,
            child: Row(
              children: [
                Text(
                  "Developed By",
                  style: TextStyle(
                      color: Color.fromRGBO(81, 81, 81, 0.8),
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
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * .17),
                  _title(),
                  SizedBox(height: 10),
                  _subtitle(),
                  SizedBox(height: height * 0.06),
                  _emailPasswordWidget(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(49, 49, 49, 1))),
                  ),
                  SizedBox(
                    height: height * .10,
                  ),
                  InkWell(
                      onTap: () {

                        Navigator.push(context, ScaleTransationRoute(page: HomePage()));

//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => HomePage()
//                            )
//                        );
                      },
                      child: _submitButton()),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }

}
