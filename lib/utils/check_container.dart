import 'package:flutter/material.dart';

class DrawCheckContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Color write;
  DrawCheckContainer(this.text, this.color, this.write);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: write, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
