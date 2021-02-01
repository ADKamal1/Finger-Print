import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/authentication_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/ui/genral_roules.dart';
import 'package:my_finger_printer/ui/inquires.dart';
import 'package:my_finger_printer/utils/common_container.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  final Color backg = Colors.black;
  final Color write = Colors.white;
  AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    UserBloc userBloc = Provider.of<UserBloc>( context);
    // AuthenticationBloc authenticationBloc =
    //     Provider.of<AuthenticationBloc>(context);
    // authenticationBloc.user.userData;
    return SafeArea(
      bottom: true,
      child: Scaffold(
        // resizeToAvoidBottomPadding: true,
        body: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                    height: height * .1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Color.fromRGBO(60, 60, 60, 1),
                    )),
                Positioned(
                  top: height * 0.02,
                  left: width * 0.29,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avater.png'),
                    radius: 70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .15,
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
                    height: height * 0.45,
                    width: width * 0.8,
                    padding: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 5),
                          child: Text(
                            'Department',
                            style: TextStyle(
                                color: Color.fromRGBO(60, 60, 60, 0.9),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            userBloc.user.userData.department,
                            //                   authenticationBloc.user.userData.department,
                            style: TextStyle(
                                color: Color.fromRGBO(116, 116, 116, 0.9),
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Text(
                            'Job Title',
                            style: TextStyle(
                                color: Color.fromRGBO(60, 60, 60, 0.9),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            userBloc.user.userData.job,
//                        authenticationBloc.user.userData.job,
                            style: TextStyle(
                                color: Color.fromRGBO(116, 116, 116, 0.9),
                                fontSize: 15),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20, left: 5),
                        //   child: Text(
                        //     'Job Title',
                        //     style: TextStyle(
                        //         color: Color.fromRGBO(60, 60, 60, 0.9),
                        //         fontSize: 22,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5, left: 10),
                        //   child: Text(
                        //     authenticationBloc.user.userData.job,
                        //     style: TextStyle(
                        //         color: Color.fromRGBO(116, 116, 116, 0.9),
                        //         fontSize: 15),
                        //   ),
                        // ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeneralRules()));
                            },
                            child: DrawContainer('General Rules & Information',
                                15, backg, write)),
                        SizedBox(
                          height: 11,
                        ),
                        InkWell(
                            onTap: () {
                              print("zzzzzzzzzzzzzzz");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RequestsAndInq()));
                            },
                            child: DrawContainer(
                                'Requests & Inquiries', 15, backg, write))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 20,
                  right: 20,
                  child: DrawContainer(
                      // authenticationBloc.user.userData.name,
                      userBloc.user.userData.name,
                      30,
                      backg,
                      write),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
          ],
        ),
      ),
    );
  }
}
