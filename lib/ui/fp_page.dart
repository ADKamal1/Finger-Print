import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:my_finger_printer/Provider/checkIn_bloc.dart';
import 'package:my_finger_printer/Provider/checkOut_bloc.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/utils/check_container.dart';
import 'package:my_finger_printer/utils/common_container.dart';
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

  location() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        current = position;
      });

      print("fffffffffff" + position.longitude.toString());
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 150));

    userBloc = Provider.of<UserBloc>(context, listen: false);
    //wishlistBloc.getWishlistProduct();
  }

  Color colorin = Color.fromRGBO(227, 227, 227, 1);
  Color confirmWrite = Color.fromRGBO(255, 255, 255, 0.9);
  Color confirmColor = Color.fromRGBO(40, 40, 40, 1);
  Color writein = Color.fromRGBO(100, 100, 100, 0.9);
  Color writeout = Color.fromRGBO(100, 100, 100, 0.9);
  Color colorout = Color.fromRGBO(227, 227, 227, 1);
  bool frist = true;
  bool second = true;
  bool a = true, b = false, c = false;
  @override
  Widget build(BuildContext context) {
    CheckInBloc checkInBlock = Provider.of<CheckInBloc>(context);
    UserBloc userBloc = Provider.of<UserBloc>(context);
    CheckOutBloc checkOutBlock = Provider.of<CheckOutBloc>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Stack(children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.asset(
                        "assets/images/gtt.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
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
                          height: height * 0.58,
                          width: width * .93,
                          child: Column(
                            children: [
                              Divider(
                                color: Color.fromRGBO(60, 60, 60, 0.3),
                                height: 20,
                                thickness: 2,
                                indent: 40,
                                endIndent: 40,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Image.asset(
                                    "assets/images/fp.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Color.fromRGBO(40, 40, 40, 0.8),
                                height: 20,
                                thickness: 1,
                                indent: 40,
                                endIndent: 40,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    'Confirm your location to have to option to check in or out.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(40, 40, 40, 0.8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              InkWell(
                                  onTap:
                                      ((a == true && b == false && c == false))
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
                                      'Confirm Location',
                                      15,
                                      (frist)
                                          ? confirmColor
                                          : Color.fromRGBO(227, 227, 227, 1),
                                      (frist)
                                          ? confirmWrite
                                          : Color.fromRGBO(
                                              100, 100, 100, 0.9))),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: DrawCheckContainer(
                                          'Check in',
                                          frist
                                              ? colorin
                                              : Color.fromRGBO(36, 200, 139, 1),
                                          frist
                                              ? writein
                                              : Color.fromRGBO(
                                                  255, 255, 255, 0.9)),
                                    ),
                                    onTap: (a == false && c == false)
                                        ? () {
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
                                            checkInBlock.userCheckIn(
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
                                            // setState(() {
                                            //   if (checkInBlock.checkIn
                                            //           .isSubmittedSuccessfully ==
                                            //       false) {
                                            //     second = true;
                                            //     frist = false;
                                            //   }
                                            // });
                                          }
                                        : () {
                                            General.showDialogue(
                                                txtWidget: Text(
                                                    'Confirm location first'),
                                                context: context);
                                          },
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                    onTap: (a == false && b == true)
                                        ? () {
                                            print(b);
                                            setState(() {
                                              second = true;
                                              frist = false;
                                              confirmColor = colorout;
                                              confirmWrite = Color.fromRGBO(
                                                  100, 100, 100, 0.9);
                                            });

                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                            checkOutBlock.userCheckOut(
                                                context: context,
                                                date: DateTime.now(),
                                                lat: current.latitude
                                                    .toString()
                                                    .trim(),
                                                lon: current.longitude
                                                    .toString()
                                                    .trim());
                                          }
                                        : () {
                                            // General.showDialogue(
                                            //     txtWidget: Text(
                                            //         'Confirm location first'),
                                            //     context: context);
                                          },
                                    child: DrawCheckContainer(
                                        'Check out',
                                        second
                                            ? colorout
                                            : Color.fromRGBO(249, 96, 96, 1),
                                        second
                                            ? writein
                                            : Color.fromRGBO(
                                                255, 255, 255, 0.9)),
                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                          ),
                                          child: userBloc.user.userData.name ==
                                                  null
                                              ? Container()
                                              : Text(
                                                  userBloc.user.userData.name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 0.9),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 60),
                                          child: userBloc.user.userData.id ==
                                                  null
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
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/avater.png'),
                                    // backgroundColor: Colors.white,
                                    radius: 30,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
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
                          height: 70,
                          width: 70,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
