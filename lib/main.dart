import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/authentication_bloc.dart';
import 'Provider/general_bloc.dart';

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
      ChangeNotifierProvider<AuthenticationBloc>.value(
        value: AuthenticationBloc(),
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
