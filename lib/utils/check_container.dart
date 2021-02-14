import 'package:flutter/material.dart';

class DrawCheckContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Color write;
  DrawCheckContainer(this.text, this.color, this.write);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Container(
        height: 42,
        width: width*.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: write, fontSize: 12, fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
