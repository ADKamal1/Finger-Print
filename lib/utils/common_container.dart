import 'package:flutter/material.dart';

class DrawContainer extends StatelessWidget {
  final String data;
  final double radius;

  DrawContainer(this.data, this.radius);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromRGBO(40, 40, 40, 1),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
