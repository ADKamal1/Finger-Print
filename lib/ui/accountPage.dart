import 'package:flutter/material.dart';
import 'package:my_finger_printer/utils/common_container.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
                height: 100, // height*.15
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.black87,
                )),
            Positioned(
              top: 50,
              left: 127,
              child: CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       //''),
                  //   backgroundColor: Colors.white,
                  //   radius: 60,
                  //
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 95,
        ),
        Stack(
          overflow: Overflow.visible,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Container(
                height: 370,
                width: 320,
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
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Marketing Department',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        'Job Title',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Digital Marketing Specialist',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        'Job Title',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Digital Marketing Specialist',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DrawContainer('General Rules & Information', 15),
                    SizedBox(
                      height: 10,
                    ),
                    DrawContainer('Requests & Inquiries', 15)
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
            'Developed By Logo',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
