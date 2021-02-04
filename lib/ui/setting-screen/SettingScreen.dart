import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/localization_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  _changeLang(BuildContext context) {
    LocalizationBloc localizationBloc =
        Provider.of<LocalizationBloc>(context, listen: false);
    localizationBloc.changeDirection();
    General.showToast(
      txt: TranslationBase.of(context)
          .getStringLocaledByKey('LANGUAGE_HAS_CHANGED'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              elevation: 10,
              shadowColor: Colors.black87,
              child: ListTile(
                leading: Icon(Icons.language, color: Colors.black),
                title: Text(
                  TranslationBase.of(context).getStringLocaledByKey('CL'),
                  style: TextStyle(
                      inherit: false, fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  _changeLang(context);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              )),
          Card(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              elevation: 10,
              shadowColor: Colors.black87,
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.black),
                title: Text(
                  TranslationBase.of(context).getStringLocaledByKey('Logout'),
                  style: TextStyle(
                      inherit: false, fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  _logout(context);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              )),
        ],
      ),
    );
  }


  _logout(BuildContext context) async {
    UserBloc _userBloc = Provider.of<UserBloc>(context, listen: false);
    _userBloc.logout(context);
    Navigator.pop(context);
  }
}
