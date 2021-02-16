import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/ui/genral_roules.dart';
import 'package:my_finger_printer/ui/inquires.dart';
import 'package:my_finger_printer/utils/common_container.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Color backg = Color.fromRGBO(20, 20, 20, 0.9);
  final Color write = Colors.white;
  AuthenticationBloc authenticationBloc;
  User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() async {
    await Future.delayed(Duration(milliseconds: 150));
    user = await SharedPreferenceHandler.getUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(60, 60, 60, 1),
        elevation: 0.0,

      ),
      body: ListView(
          children: [
            SizedBox(
              height: height * .02,
            ),


            CircleAvatar(
                radius: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset('assets/images/avater.png'
                  ),
                ),
              ),



            SizedBox(
              height: height * .05,
            ),
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                Card(
                  shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: height * 0.50,
                    width: width * 0.8,
                    padding: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.05, left: 5),
                          child: Text(
                            TranslationBase.of(context)
                                .getStringLocaledByKey('dep'),
                            style: TextStyle(
                                color: Color.fromRGBO(60, 60, 60, 0.9),
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        user == null
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: user.userData.department==null?Text(
                                  "",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color.fromRGBO(116, 116, 116, 0.9),
                                      fontSize: 14),
                                ):Text(
                                  user.userData.department,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color.fromRGBO(116, 116, 116, 0.9),
                                      fontSize: 14),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02, left: 5),
                          child: Text(
                            TranslationBase.of(context)
                                .getStringLocaledByKey('job'),
                            style: TextStyle(
                                color: Color.fromRGBO(60, 60, 60, 0.9),
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        user == null
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: user.userData.job == null? Text(
                                  "",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color.fromRGBO(116, 116, 116, 0.9),
                                      fontSize: 14),
                                ):Text(
                                  user.userData.job,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color.fromRGBO(116, 116, 116, 0.9),
                                      fontSize: 14),
                                ),
                              ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeneralRules()));
                            },
                            child: DrawContainer(
                                TranslationBase.of(context)
                                    .getStringLocaledByKey('gr'),
                                15,
                                backg,
                                write)),
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RequestsAndInq()));
                            },
                            child: DrawContainer(
                                TranslationBase.of(context)
                                    .getStringLocaledByKey('ri'),15,backg,write)
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 20,
                  right: 20,
                  child: user == null
                      ? Container()
                      : DrawContainer(
                          // authenticationBloc.user.userData.name,
                          user.userData.name,
                          30,
                          backg,
                          write),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
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
                      height: height * 0.08,
                      width: 70,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
