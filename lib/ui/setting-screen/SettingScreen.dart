import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/localization_bloc.dart';
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
    General.showToast(txt: TranslationBase.of(context)
        .getStringLocaledByKey('LANGUAGE_HAS_CHANGED'),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          InkWell(
            onTap: ()=> _changeLang(context),
            child: Text("Change Langauge"),
          ),


        ],
      ),
    );
  }
}
