import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpRequest;
import 'package:my_finger_printer/models/Calender.dart';
import 'package:my_finger_printer/models/CheckIn.dart';
import 'package:my_finger_printer/models/CheckOut.dart';
import 'package:my_finger_printer/models/GeneralInfo.dart';
import 'package:my_finger_printer/models/Status.dart';
import 'package:my_finger_printer/models/request.dart';
import 'package:my_finger_printer/models/user.dart';
import 'package:my_finger_printer/widgets/shared_preference.dart';

import 'api_service.dart';

class Api {
  String email;
  String code;
  String serial;
  User user;

  getUserInfo()async {
    user = await SharedPreferenceHandler.getUserData();
    serial = await SharedPreferenceHandler.getUserSerial();
  }

  login(
      {String email,
      String password,
      String serial,
      BuildContext context}) async {
    try {
      var url = APIService().createPath('Employee/Login');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "code":password,
        "serial":"54321",
        "email":email
      };
      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userInfo = json.decode(response.body)['result'];
        print("user : ${userInfo}");
        return User.fromJson(userInfo);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  getUserStatus(
      {
      BuildContext context}) async {
    try {
      await getUserInfo();
      var url = APIService().createPath('Employee/Status');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      print("\nApi ${user.userData.code}");
      print("\nApi ${serial}");
      print("\nApi ${user.userData.email}");
      var params = {
        "code": user.userData.code,
        "serial": "54321",
        //"serial": serial,
        "email": user.userData.email,
      };
      print("\n Params : ${params}");
      var body = json.encode(APIService().createPayload(params));
      final response = await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var statusInfo = json.decode(response.body)['result'];
        print("status : ${statusInfo}");
        return Status.fromJson(statusInfo);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  checkIn({
//    String email,
//    String password,
//    String serial,
    DateTime date, String lat, String lon, BuildContext context}) async {
    try {
      await getUserInfo();

      var url = APIService().createPath('Employee/CheckIn');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "code": user.userData.code,
        "serial": "54321",
        //"serial": serial,
        "email": user.userData.email,
        "date": date.toIso8601String(),
        "lat": lat,
        "lon": lon
      };

      print("params : ${params}");


      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userCheckIn = json.decode(response.body)['result'];
        print("user : ${userCheckIn}");
        return CheckIn.fromJson(userCheckIn);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  GeneralRule({String massage, String type, BuildContext context}) async {
    try {
      var url = APIService().createPath('Employee/Rules');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "email": "amr@sovisions.com",
        "code": "112233",
        "serial": "54321",
        "message": "Salary",
        "type": "Salary"
      };
      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var rulesInfo = json.decode(response.body)['result'];
        print("ruels info : ${rulesInfo}");
        return GeneralInfo.fromJson(rulesInfo);
      } else {
        print("xxxxxxxxxxxxxxxxx");
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  checkOut(
      {
        DateTime date, String lat, String lon, BuildContext context}) async {
    try {
      await getUserInfo();
      var url = APIService().createPath('Employee/CheckOut');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "code": user.userData.code,
        "serial": "54321",
        //"serial": serial,
        "email": user.userData.email,
        //"serial": serial,
        "date": date.toIso8601String(),
        "lat": lat,
        "lon": lon
      };

      print("userparams : ${params}");


      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userCheckOut = json.decode(response.body)['result'];
        print("user : ${userCheckOut}");
        return CheckOut.fromJson(userCheckOut);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  Requests(
      {String email,
      String password,
      String massage,
      String type,
      BuildContext context}) async {
    try {
      var url = APIService().createPath('Employee/Requests');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "email": email,
        "code": password,
        "serial": "54321",
        "message": massage,
        "type": type
      };
      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var requestInfo = json.decode(response.body)['result'];
        print("request : ${requestInfo}");
        return Request.fromJson(requestInfo);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }

  getCalenderEvents(
      {String email,
      String password,
      DateTime dateTime,
      BuildContext context}) async {
    try {
      var url = APIService().createPath('Employee/Calender');

      User user = await SharedPreferenceHandler.getUserData();
      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "email": user.userData.email,
        "code": user.userData.code,
        "serial": "54321",
        "date": dateTime.toIso8601String(),
      };
      var body = json.encode(APIService().createPayload(params));
      final response =
          await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var requestInfo = json.decode(response.body)['result'];

        print("request00000000000000000000000000000000 : ${requestInfo}");
        return Calender.fromJson(requestInfo);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e;
    }
  }
}
