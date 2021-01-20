import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/animations/scale-transation-route.dart';
import 'package:my_finger_printer/utils/values.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'general_bloc.dart';


class AuthenticationBloc  extends GeneralBloc{
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  OdooUser odooUser;


  loginService(String username, String password,bool rememberMe , BuildContext context) async {
    _isWaiting = true;
    notifyListeners();
    var client = OdooClient('${Values.baseUrl}');
    String DbName = Values.dataBaseName;
    AuthenticateCallback authenticateCallback = await client.authenticate(username, password, DbName);
    if (authenticateCallback.isSuccess) {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', authenticateCallback.getUser().name.toString());
      prefs.setInt('uid', authenticateCallback.getUser().uid);
      prefs.setString( 'partner_id', authenticateCallback.getUser().partnerId.toString());
      prefs.setString('company_id', authenticateCallback.getUser().companyId.toString());
      prefs.setString( 'username', authenticateCallback.getUser().username.toString());
      prefs.setString('lang', authenticateCallback.getUser().lang.toString());
      prefs.setString( 'database', authenticateCallback.getUser().database.toString());
      prefs.setString('session_id', authenticateCallback.getUser().sessionId.toString());
      prefs.setBool("rememberMe", rememberMe);

      //SharedPreferenceHandler.setRememberMe(rememberMe);


      _isWaiting = false;
      notifyListeners();
//      Navigator.pushAndRemoveUntil(
//          context,
//          ScaleTransationRoute(
//              page: TabsScreen()),
//              (Route<dynamic> route) => false);
    }
    else {
        _isWaiting = false;
        notifyListeners();
        General.showDialogue(txtWidget: Text("username or password incorrect"), context: context);
      }

  }




}


