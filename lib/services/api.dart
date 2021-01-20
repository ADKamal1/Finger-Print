import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as httpRequest;
import 'package:my_finger_printer/models/user.dart';

import 'api_service.dart';

class Api {


  login({String email, String password,BuildContext context}) async {
    try {
      var url = APIService().createPath('Employee/Login');

      ////- Run
      Map<String, String> _headers = {
        'Content-type': 'application/json',
        //'Cookie': 'session_id=${sharedPreferences.getString('session_id')}'
      };

      var params = {
        "email":email,
        "code":password,
        "serial":"123123",
      };
      var body = json.encode(APIService().createPayload(params));
      final response = await httpRequest.post(url, body: body, headers: _headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var userInfo = json.decode(response.body)['result'];
        print("user : ${userInfo}");
        return User.fromJson(userInfo);
      } else {
        throw Exception ( 'Failed to load Data' );
      }
    } catch (e) {
      throw e;
    }

  }




}
