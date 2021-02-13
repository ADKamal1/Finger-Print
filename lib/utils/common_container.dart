import 'package:flutter/material.dart';

class DrawContainer extends StatelessWidget {
  final String data;
  final double radius;
  final Color backgroundColor;
  final Color writeColor;

  DrawContainer(this.data, this.radius, this.backgroundColor, this.writeColor);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Container(
        height: 43,
       // width: width*.65,
        margin: EdgeInsets.only(left: 15,right: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: writeColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
                fontFamily: "Montserrat"
            ),
          ),
        ),
      ),
    );
  }
}
