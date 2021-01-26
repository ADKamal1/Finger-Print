import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/reqsest_bloc.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/authentication_bloc.dart';
import 'Provider/checkOut_bloc.dart';
import 'Provider/general_bloc.dart';
import 'Provider/user_bloc.dart';
import 'widgets/global-functions.dart';

void main() async {
  Widget _defaultHome = SplashScreen();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(app(_defaultHome));
  //runApp(MyApp());
}

Widget app(Widget startScreen) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<GeneralBloc>.value(
        value: GeneralBloc(),
      ),
      ChangeNotifierProvider<UserBloc>.value(
        value: UserBloc(),
      ),
      ChangeNotifierProvider<AuthenticationBloc>.value(
        value: AuthenticationBloc(),
      ),
      ChangeNotifierProvider<Request_Bloc>.value(
        value: Request_Bloc(),
      ),
      ChangeNotifierProvider<CheckInBloc>.value(
        value: CheckInBloc(),
      ),
      ChangeNotifierProvider<CheckOutBloc>.value(
        value: CheckOutBloc(),
      ),
      ChangeNotifierProvider<CalenderBloc>.value(
        value: CalenderBloc(),
      ),
    ],
    child: MyApp(
      defaultHome: startScreen,
      //defaultHome: TabsScreen(),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget defaultHome;

  MyApp({this.defaultHome});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

  }



  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.defaultHome,
    );
  }
}
