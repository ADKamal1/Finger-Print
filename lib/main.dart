import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          //  primaryColor: ColorAssets.primarySwatchColor,
          //accentColor: ColorAssets.accentColor,
          ),
      home: SplashScreen(),
    );
  }
}
