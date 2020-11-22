import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/utils/check_container.dart';
import 'package:my_finger_printer/utils/common_container.dart';

class FPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
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
                    height: height * .62,
                    width: width * .93,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
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
                            height: MediaQuery.of(context).size.height * 0.2,
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
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                          height: 40,
                        ),
                        DrawContainer('Confirm Location', 15),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: DrawCheckContainer('Check in'),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            DrawCheckContainer('Check out'),
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
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 20),
                                    child: Text(
                                      'Ahmed Mohamed',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.9),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60),
                                    child: Text(
                                      'ID:',
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
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text('Developed By',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(40, 40, 40, 0.8),
                )),
          )
        ],
      ),
    );
  }
}
