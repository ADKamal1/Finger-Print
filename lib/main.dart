import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/reqsest_bloc.dart';
import 'package:my_finger_printer/ui/home-page-screen.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/authentication_bloc.dart';
import 'Provider/checkOut_bloc.dart';
import 'Provider/general_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  Widget _defaultHome = (email == null) ? SplashScreen : HomePage();
  runApp(app(_defaultHome));
  //runApp(MyApp());
}

Widget app(Widget startScreen) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<GeneralBloc>.value(
        value: GeneralBloc(),
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.defaultHome,
    );
  }
}
