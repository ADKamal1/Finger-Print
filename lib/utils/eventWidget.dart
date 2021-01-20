import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  String title;
  Color color;
  Icon icon;
  String dateFormatted;
  bool lineThrough;

  EventWidget(
      {this.title,
      this.color,
      this.icon,
      this.dateFormatted,
      this.lineThrough});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black26,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              decoration: lineThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        subtitle: Text(
          dateFormatted,
          style: TextStyle(
              decoration: lineThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Container(
          height: 30,
          width: 5,
          color: color,
        ),
      ),
    );
  }
}
