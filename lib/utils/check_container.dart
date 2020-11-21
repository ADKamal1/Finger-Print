import 'package:flutter/material.dart';

class DrawCheckContainer extends StatelessWidget {
  final String text;
  DrawCheckContainer(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade400,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black54
          ),
        ),
      ),
    );
  }
}
