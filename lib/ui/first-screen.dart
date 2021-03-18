import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';
import 'package:provider/provider.dart';

import 'home-page-screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  UserBloc userBloc;
  User userData;
  bool _firstTime = true;


  init() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = await SharedPreferenceHandler.getUserData();
    userBloc = Provider.of<UserBloc>(context, listen: false);

    if (userData != null) {
      print("ggggggggg: ${userData.userData.name.toString()}");
      userBloc.setUser(currentUser: userData);
      //print("\nuserDataInFirstScreen: ${userData.userData.name}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
//          context, MaterialPageRoute(builder: (context) => LoginPage()));

    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
        ModalRoute.withName('/'),
      );
    }
  }

  void initState()  {
    super.initState();
     //init();
  }

  @override
  void didChangeDependencies() async {
    if (_firstTime){
      await init();
      _firstTime = false;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
