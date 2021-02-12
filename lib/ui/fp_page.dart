import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/checkOut_bloc.dart';
import 'package:my_finger_printer/Provider/status_block.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/utils/check_container.dart';
import 'package:my_finger_printer/utils/common_container.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/widgets/general.dart';
import 'package:provider/provider.dart';

class FPPage extends StatefulWidget {
  final bool location = true;

  @override
  _FPPageState createState() => _FPPageState();
}

class _FPPageState extends State<FPPage> {
  final Geolocator geolocator = Geolocator();
  UserBloc userBloc;
  Position current;
  StatusBloc userStateBloc;

  location() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        current = position;
      });

      print("lat:" + position.latitude.toString().substring(0, 7));

      print("long:" + position.longitude.toString().substring(0, 7));
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    //StatusBar.color(Colors.black);
    location();
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 150));

    userBloc = Provider.of<UserBloc>(context, listen: false);
    userStateBloc = Provider.of<StatusBloc>(context, listen: false);
    await userStateBloc.getUserState();
  }

  confirmLocation() async {
    await Future.delayed(Duration(milliseconds: 150));
    print("Confirm location");
    location();
    setState(() {
      frist = false;
      a = false;
    });
  }

  Color colorin = Color.fromRGBO(227, 227, 227, 1);
  Color colorout = Color.fromRGBO(227, 227, 227, 1);

  Color confirmWrite = Color.fromRGBO(255, 255, 255, 0.9);
  Color confirmColor = Color.fromRGBO(40, 40, 40, 1);
  Color writein = Color.fromRGBO(100, 100, 100, 0.9);
  Color writeout = Color.fromRGBO(100, 100, 100, 0.9);
  bool frist = true;
  bool second = true;
  bool a = true, b = false, c = false;
  @override
  Widget build(BuildContext context) {
    CheckInBloc checkInBlock = Provider.of<CheckInBloc>(context);
    UserBloc userBloc = Provider.of<UserBloc>(context);
    CheckOutBloc checkOutBlock = Provider.of<CheckOutBloc>(context);
    userStateBloc = Provider.of<StatusBloc>(context, listen: true);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            /// Top image
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height * .01),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.15,
                  child: Image.asset(
                    "assets/images/gtt.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            //////--Ckeck in - out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                shadowColor: Color.fromRGBO(0, 0, 0, 0.16),
                elevation: 6,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: height * 0.55,
                      width: width * .92,
                      child: Column(
                        children: [
                          Divider(
                            color: Color.fromRGBO(60, 60, 60, 0.3),
                            height: 10,
                            thickness: 2,
                            indent: 40,
                            endIndent: 40,
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          /// image of fp
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Image.asset(
                                "assets/images/fp.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Color.fromRGBO(40, 40, 40, 0.8),
                            height: 20,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),

                          ////-- Confirm Location tEXT
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                TranslationBase.of(context)
                                    .getStringLocaledByKey(
                                        'CONFIRM_LOCATION_TEXT'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(40, 40, 40, 0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: height * 0.02,
                          ),

                          ///// confirm Location Button
                          InkWell(
                              onTap: ((a == true && b == false && c == false) &&
                                      userBloc.user.userData.is_located ==
                                          false)
                                  ? () async {
                                      await Future.delayed(
                                          Duration(milliseconds: 150));
                                      print("Confirm location");
                                      location();
                                      setState(() {
                                        frist = false;
                                        a = false;
                                      });
                                    }
                                  : () {},
                              child: DrawContainer(
                                  TranslationBase.of(context)
                                      .getStringLocaledByKey(
                                          'Confirm Location'),
                                  15,
                                  (frist)
                                      ? confirmColor
                                      : Color.fromRGBO(227, 227, 227, 1),
                                  (frist)
                                      ? confirmWrite
                                      : Color.fromRGBO(100, 100, 100, 0.9))),

                          SizedBox(
                            height: 10,
                          ),

                          //// CheckInAnd Out Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Consumer<StatusBloc>(
                                  builder: (BuildContext context, state, __) {
                                if (state.error != null) {
                                  return Center(
                                      child:
                                          General.buildTxt(txt: state.error));
                                } else if (state.hasData) {
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: DrawCheckContainer(
                                          TranslationBase.of(context)
                                              .getStringLocaledByKey(
                                                  'Check In'),
                                          userStateBloc.status.model.status ==
                                                  "checked_in"
                                              //frist
                                              ? colorin
                                              : Color.fromRGBO(36, 200, 139, 1),
                                          frist
                                              ? writein
                                              : Color.fromRGBO(
                                                  255, 255, 255, 0.9)),
                                    ),
                                    onTap: (a == false && c == false)
                                        ? () async {
                                            Future.delayed(Duration(seconds: 2))
                                                .then((value) => () {
                                                      setState(() {
                                                        second = false;
                                                        frist = true;
                                                        b = false;

                                                        confirmColor = colorin;
                                                        confirmWrite =
                                                            Color.fromRGBO(100,
                                                                100, 100, 0.9);
                                                      });
                                                    });

                                            formatStringWithTimeFromDate(
                                                DateTime date) {
                                              //DateTime myDate = DateTime.parse(date);
                                              return new DateFormat(
                                                      'yyyy-MM-dd hh:mm:ss')
                                                  .format(date);
                                            }

                                            var a =
                                                formatStringWithTimeFromDate(
                                                    DateTime.now());

                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                            await checkInBlock.userCheckIn(
                                                context: context,
                                                date: DateTime.parse(
                                                    formatStringWithTimeFromDate(
                                                        DateTime.now())),
                                                lat: current.latitude
                                                    .toString()
                                                    .trim(),
                                                lon: current.longitude
                                                    .toString()
                                                    .trim());
                                            userStateBloc.getUserState();
                                            setState(() {});
                                            // setState(() {
                                            //   if (checkInBlock.checkIn
                                            //           .isSubmittedSuccessfully ==
                                            //       false) {
                                            //     second = true;
                                            //     frist = false;
                                            //   }
                                            // });
                                          }
                                        : (a == true && c == false)
                                            ? () {
                                                print("a ${a}..b${c}");
                                                General.showDialogue(
                                                    txtWidget: Text(TranslationBase
                                                            .of(context)
                                                        .getStringLocaledByKey(
                                                            'CONFIRM_LOCATION_FIRST')),
                                                    context: context);
                                              }
                                            : () {
                                                print("a ${a}..c${c}");
                                              },
                                  );
                                } else {
                                  return Center(
                                      child: General.customThreeBounce(context,
                                          color: Theme.of(context).accentColor,
                                          size: 20.0));
                                }
                              }),
                              Center(
                                child: Consumer<StatusBloc>(
                                    builder: (BuildContext context, state, __) {
                                  if (state.error != null) {
                                    return Center(
                                        child:
                                            General.buildTxt(txt: state.error));
                                  } else if (state.hasData) {
                                    return GestureDetector(
                                      onTap: (state.status.model.status ==
                                                  "checked_in" &&
                                              a == false)
                                          ? () async {
                                              print("000000000000");
                                              setState(() {
                                                second = true;
                                                frist = false;
                                                confirmColor = colorout;
                                                confirmWrite = Color.fromRGBO(
                                                    100, 100, 100, 0.9);
                                              });
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                              await checkOutBlock.userCheckOut(
                                                  context: context,
                                                  date: DateTime.now(),
                                                  lat: current.latitude
                                                      .toString()
                                                      .trim(),
                                                  lon: current.longitude
                                                      .toString()
                                                      .trim());
                                              await state.getUserState();
                                              setState(() {});
                                            }
                                          : (a == true && b == false)
                                              ? () {
                                                  print("Out1:${a}:${b}");
                                                  General.showDialogue(
                                                      txtWidget: Text(
                                                        TranslationBase.of(
                                                                context)
                                                            .getStringLocaledByKey(
                                                                'CONFIRM_LOCATION_FIRST'),
                                                      ),
                                                      context: context);
                                                }
                                              : () {
                                                  print("Out2:${a}:${b}");
                                                  General.showDialogue(
                                                      txtWidget: Text(
                                                        TranslationBase.of(
                                                                context)
                                                            .getStringLocaledByKey(
                                                                'DIALOG_FIRST_LOGIN'),
                                                      ),
                                                      context: context);
                                                },
                                      child: DrawCheckContainer(
                                          TranslationBase.of(context)
                                              .getStringLocaledByKey(
                                                  'Check Out'),
                                          userStateBloc.status.model.status ==
                                                  "checked_out"
                                              ? colorout
                                              : Color.fromRGBO(249, 96, 96, 1),
                                          second
                                              ? writein
                                              : Color.fromRGBO(
                                                  255, 255, 255, 0.9)),
                                    );
                                  } else {
                                    return Center(
                                        child: General.customThreeBounce(
                                            context,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 20.0));
                                  }
                                }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: -20,
                        left: 15,
                        right: 15,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 45,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(40, 40, 40, 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                      ),
                                      child: userBloc.user == null
                                          ? Container()
                                          : Text(
                                              userBloc.user.userData.name,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.8)),
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: userBloc.user == null
                                          ? Container()
                                          : Text(
                                              'ID:  ${userBloc.user.userData.id}',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.8)),
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 18,
                              top: -7,
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/avater.png',
                                  height: 70.0,
                                  width: 70.0,
                                  fit: BoxFit.cover,
                                  image:
                                      "http://159.65.227.64:8069/web/image/hr.employee/21/image"),
                              //checkUrl('http://159.65.227.64:8069/web/image/hr.employee/21/image'),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),

            /// developed by
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Text(
                    "Developed By",
                    style: TextStyle(
                        color: Color.fromRGBO(41, 41, 41, 1),
                        fontSize: 12,
                        inherit: false),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/component.png",
                      fit: BoxFit.cover,
                      height: height * .1,
                      width: 70,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
