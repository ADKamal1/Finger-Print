import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finger_printer/Provider/celander_bloc.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/general_info_bloc.dart';
import 'package:my_finger_printer/Provider/reqsest_bloc.dart';
import 'package:my_finger_printer/Provider/status_block.dart';
import 'package:my_finger_printer/ui/first-screen.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:provider/provider.dart';

import 'Provider/authentication_bloc.dart';
import 'Provider/checkOut_bloc.dart';
import 'Provider/general_bloc.dart';
import 'Provider/localization_bloc.dart';
import 'Provider/user_bloc.dart';
import 'package:device_preview/device_preview.dart' hide DeviceOrientation ;

void main() async {
  Widget _defaultHome = FirstScreen();
  WidgetsFlutterBinding.ensureInitialized();
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//    statusBarColor: Colors.grey.shade600, // Color for Android
//    statusBarBrightness: Brightness.dark,
//    systemNavigationBarColor: (Platform.isIOS)
//        ? Colors.black
//        : Colors.white70, // Dark == white status bar -- for IOS.
//  ));
  runApp(app(_defaultHome));
  //runApp(DevicePreview(builder:(context)=> app(_defaultHome)));

  //runApp(MyApp());
}








/// puch
Widget app(Widget startScreen) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<GeneralBloc>.value(
        value: GeneralBloc(),
      ),
      ChangeNotifierProvider<StatusBloc>.value(
        value: StatusBloc(),
      ),
      ChangeNotifierProvider<GeneralInfoBloc>.value(
        value: GeneralInfoBloc(),
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
      ChangeNotifierProvider<LocalizationBloc>.value(
        value: LocalizationBloc(),
      ),
    ],
    child: MyApp(
      defaultHome: startScreen,
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
    final LocalizationBloc localizationBloc =
        Provider.of<LocalizationBloc>(context);

    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: widget.defaultHome,
      locale: localizationBloc.appLocal,
      localizationsDelegates: [
        const TranslationBaseDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ar', ''), // Arabic
        const Locale('en', ''), // English
      ],
    );
  }
}
