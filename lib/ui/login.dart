import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_ids/unique_ids.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationBloc authenticationBloc;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailControllor = new TextEditingController();
  TextEditingController _passwordControllor = new TextEditingController();
  String serial = "123123";
  User user;

  @override
  void initState() {
    super.initState();
    // StatusBar.color(Colors.black);
    init();
    initUniqueIdentifierState();
  }

  Future<void> initUniqueIdentifierState() async {
    String adId;
    String uuid;

    try {
      uuid = await UniqueIds.uuid;
    } on PlatformException {
      uuid = 'Failed to create uuid.v1';
    }

    try {
      adId = await UniqueIds.adId;
    } on PlatformException {
      adId = 'Failed to get adId version.';
    }

    if (!mounted) return;

    setState(() {
      serial = adId;
    });
  }

  init() async {
    authenticationBloc = Provider.of<AuthenticationBloc>(context, listen: false);
  }

  _login() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      print("\nkkk:-");
      print(serial);
      authenticationBloc.loginService(_emailControllor.text.trim(),
          _passwordControllor.text.trim(), serial.trim(), context);

      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.setString('email', _emailControllor.text.trim());
    }
  }

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
              child:TranslationBase.of(context).locale=='en'?
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ):Icon(
                Icons.arrow_forward_ios,
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
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(49, 49, 49, 1)),
          ),
          (!isPassword)
              ? TextFormField(
                  controller: _emailControllor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      hintText: 'amr@sovision.com',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(198, 198, 198, 1),
                          fontSize: 16),
                      fillColor: Colors.white10,
                      filled: true),
                  cursorColor: Color.fromRGBO(0, 0, 0, 0.7),
                  validator: (val) {
                    val = _emailControllor.text.toString();
                    if (val.isEmpty) return 'enter a valid E-Mail';
                  },
                )
              : TextFormField(
                  controller: _passwordControllor,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(0, 0, 0, 0.7),
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
                      filled: true),
                  validator: (val) {
                    val = _passwordControllor.text.toString();
                    if (val.isEmpty) return 'enter a valid password';
                  },
                ),
        ],
      ),
    );
  }

//  Widget _submitButton() {
//    AuthenticationBloc authenticationBloc = Provider.of<AuthenticationBloc>(context);
//
//    return Container(
//        width: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.symmetric(vertical: 15),
//        alignment: Alignment.center,
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.all(Radius.circular(5)),
//          color: Color.fromRGBO(40, 40, 40, 1),
//        ),
//        child: !authenticationBloc.isWaiting
//            ? General.buildTxt(
//            txt: TranslationBase.of(context)
//                .getStringLocaledByKey('LOGIN'),
//            color: Colors.white,
//            fontSize: 16.0)
//            : General.customThreeBounce(context)
//    );
//
//  }

  Widget _title() {
    return Text(
      TranslationBase.of(context).getStringLocaledByKey('Welcome back'),
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 32, color: Color.fromRGBO(49, 49, 49, 1),fontFamily: "Montserrat"),
    );
  }

  Widget _subtitle() {
    return Text(
      TranslationBase.of(context).getStringLocaledByKey('sign'),
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16, color: Color.fromRGBO(155, 155, 155, 1),fontFamily: "Montserrat"),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(TranslationBase.of(context).getStringLocaledByKey('EID')),
        _entryField(TranslationBase.of(context).getStringLocaledByKey('pass'),
            isPassword: true),
      ],
    );
  }

  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc = Provider.of<AuthenticationBloc>(context);
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
                  SizedBox(height: height * 0.03),
                  Form(
                    key: _formKey,
                    child: _emailPasswordWidget(),
                  ),
//                  Container(
//                    padding: EdgeInsets.symmetric(vertical: 10),
//                    alignment: Alignment.centerRight,
//                    child: Text(
//                        TranslationBase.of(context)
//                            .getStringLocaledByKey('forg'),
//                        style: TextStyle(
//                            fontSize: 18,
//                            color: Color.fromRGBO(49, 49, 49, 1))),
//                  ),




                ////-Login
                  SizedBox(height: height * .05),
                  InkWell(
                      onTap: () => !authenticationBloc.isWaiting ? _login() : null,
                      child:
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromRGBO(40, 40, 40, 1),
                          ),
                          child: !authenticationBloc.isWaiting
                              ? General.buildTxt(
                              txt: TranslationBase.of(context).getStringLocaledByKey('LOGIN'),
                              color: Colors.white,fontSize: 16.0)
                              : General.customThreeBounce(context,size: 18.0,color: Colors.white)
                      ),
                  ),
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
