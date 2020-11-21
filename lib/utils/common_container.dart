import 'package:flutter/material.dart';

class DrawContainer extends StatelessWidget {
  final String data;
  final double radius;
  DrawContainer(this.data,this.radius);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
