import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finger_printer/utils/check_container.dart';
import 'package:my_finger_printer/utils/common_container.dart';

class FPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(
          'gtt',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: height * .63,
                  width: width * .93,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Icon(
                          Icons.fingerprint,
                          size: 120,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.black,
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
                                color: Colors.grey.shade700, fontSize: 16),
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
                            color: Colors.black87,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text(
                                    'ID:',
                                    style: TextStyle(color: Colors.grey),
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
                            // Image.asset(
                            //   'assets/images/img_sample_photo_profile.jpg',
                            //   width: MediaQuery.of(context).size.width,
                            //   fit: BoxFit.fill,
                            // ),
                            backgroundColor: Colors.white,
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
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200),
          child: Text(
            'Developed By Logo',
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
