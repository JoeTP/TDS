import 'package:flutter/material.dart';

Widget controlArrows({
  double size = 100,
  required IconData arrow,
  required VoidCallback function,
  Color color = Colors.green,
  double iconsize = 80,
}) =>
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        backgroundColor: color,
        onPressed: function,
        child: Icon(
          arrow,
          size: iconsize,
          color: Colors.white,
        ),
      ),
    );

class sideMenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[],
      ),
    );
    ;
  }
}
