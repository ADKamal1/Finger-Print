import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/general_info_bloc.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:provider/provider.dart';

class GeneralRules extends StatefulWidget {
  @override
  _GeneralRulesState createState() => _GeneralRulesState();
}

class _GeneralRulesState extends State<GeneralRules> {
  GeneralInfoBloc generalInfoBloc;
  @override
  void initState() {
    // TODO: implement initState
    _init();
  }

  _init() async {
    await Future.delayed(Duration(milliseconds: 150));

    generalInfoBloc = Provider.of<GeneralInfoBloc>(context, listen: false);
    generalInfoBloc.getGeneralService();
  }

  @override
  Widget build(BuildContext context) {
    //generalInfoBloc = Provider.of<GeneralInfoBloc>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(60, 60, 60, 1),
        elevation: 0.0,
      ),
      body: Container(
        height: height,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                  height: height * .15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(60, 60, 60, 1),
                  )),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 0, top: 45, bottom: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * 0.05,
                left: width * 0.29,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avater.png'),
                  radius: 70,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Center(
            child: Text(
              TranslationBase.of(context).getStringLocaledByKey('gr'),
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.9),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.045,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              TranslationBase.of(context).getStringLocaledByKey('s1'),
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
            child: Consumer<GeneralInfoBloc>(
                builder: (BuildContext context, state, __) {
              if (state.error != null) {
                return Center(child: General.buildTxt(txt: state.error));
              } else if (state.hasData) {
                return Text(
                  state.generalInfo.modelRules.rules,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.9),
                    fontSize: 14,
                  ),
                );
              } else {
                return Center(
                    child: General.customThreeBounce(context,
                        color: Theme.of(context).accentColor, size: 20.0));
              }
            }),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
          //   child: Text(
          //     TranslationBase.of(context).getStringLocaledByKey('s2'),
          //     style: TextStyle(
          //         color: Color.fromRGBO(0, 0, 0, 0.9),
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
          //   child: Text(
          //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry '
          //     's standard dummy text ever since . Lorem Ipsum is simply dummy text '
          //     'of the printing and typesetting industry Lorem Ipsum has been the industry'
          //     's standard dummy text ever since . '
          //     'of the printing and typesetting industry Lorem Ipsum has been the industry'
          //     's standard dummy text ever since .'
          //     'Lorem Ipsum is simply dummy text of the printing and typesetting',
          //     style: TextStyle(
          //       color: Color.fromRGBO(0, 0, 0, 0.9),
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, left: 30, right: 15),
          //   child: Text(
          //     TranslationBase.of(context).getStringLocaledByKey('s3'),
          //     style: TextStyle(
          //         color: Color.fromRGBO(0, 0, 0, 0.9),
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 8, left: 30, right: 15),
          //   child: Text(
          //     'Lorem Ipsum is simply dummy text of'
          //     ' the printing and typesetting industry'
          //     ' Lorem Ipsum has been the industrys standard dummy text ever since .',
          //     style: TextStyle(
          //       color: Color.fromRGBO(0, 0, 0, 0.9),
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String data;
  final double radius;
  final Color color;

  MyContainer(this.data, this.radius, this.color);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(228, 228, 228, 1),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                inherit: false),
          ),
        ),
      ),
    );
  }
}
