import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home-page-screen.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  UserBloc userBloc;
  User userData;

  init() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = await SharedPreferenceHandler.getuserData();
    userBloc = Provider.of<UserBloc>(context, listen: false);

    if (userData != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
      userBloc.setUser(currentUser: userData);

    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
        ModalRoute.withName('/'),
      );
    }
  }

  void initState() {
    super.initState();
    // startTime();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
