import 'package:my_finger_printer/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceHandler {
  static setUserData(User user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userData", json.encode(user));
    } catch (e) {
      print("set user sharedPreference error :${e.toString()}");
    }
  }

  static getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('userData') != null) {
        Map<String, dynamic> data = json.decode(prefs.getString('userData'));
        User user = User.fromJson(data);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  static setUserSerial(String serial) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userSerial", serial);
    } catch (e) {
      print(" serial sharedPreference error :${e.toString()}");
    }
  }

  static getUserSerial() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('userSerial') != null) {
        String userSerial = prefs.getString('userSerial');
        return userSerial;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  static removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userData");
  }


  static setLang(String lang) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("lang", lang);
    } catch (e) {
      print(e.toString());
    }
  }

  static getLang() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('lang') ?? 'en';
    } catch (e) {
      print("get lang err :$e");
    }
  }




}
