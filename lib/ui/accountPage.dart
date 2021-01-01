import 'package:flutter/material.dart';
import 'package:my_finger_printer/ui/genral_roules.dart';
import 'package:my_finger_printer/ui/inquires.dart';
import 'package:my_finger_printer/utils/common_container.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
                height: height * .1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color.fromRGBO(60, 60, 60, 1),
                )),
            Positioned(
              top: height * 0.02,
              left: width * 0.29,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avater.png'),
                radius: 70,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * .15,
        ),
        Stack(
          overflow: Overflow.visible,
          children: [
            Card(
              shadowColor: Color.fromRGBO(0, 0, 0, 0.16),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Container(
                height: height * 0.50,
                width: width * 0.8,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 5),
                      child: Text(
                        'Department',
                        style: TextStyle(
                            color: Color.fromRGBO(60, 60, 60, 0.9),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Marketing Department',
                        style: TextStyle(
                            color: Color.fromRGBO(116, 116, 116, 0.9),
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        'Job Title',
                        style: TextStyle(
                            color: Color.fromRGBO(60, 60, 60, 0.9),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Digital Marketing Specialist',
                        style: TextStyle(
                            color: Color.fromRGBO(116, 116, 116, 0.9),
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        'Job Title',
                        style: TextStyle(
                            color: Color.fromRGBO(60, 60, 60, 0.9),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Digital Marketing Specialist',
                        style: TextStyle(
                            color: Color.fromRGBO(116, 116, 116, 0.9),
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeneralRules()));
                        },
                        child:
                            DrawContainer('General Rules & Information', 15)),
                    SizedBox(
                      height: 11,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestsAndInq()));
                        },
                        child: DrawContainer('Requests & Inquiries', 15))
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 20,
              right: 20,
              child: DrawContainer('Ahmed Mahmoud', 30),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 210),
          child: Text(
            'DevelopedBy',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
