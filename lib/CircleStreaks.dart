import 'package:flutter/material.dart';

class CircleStreaks extends StatefulWidget {
  @override
  _CircleStreaksState createState() => _CircleStreaksState();
}

class _CircleStreaksState extends State<CircleStreaks> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        height: 230,
        decoration:
            new BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: Center(
          child: Text("103 DAYS OF STREAKS"),
        ));
  }
}
