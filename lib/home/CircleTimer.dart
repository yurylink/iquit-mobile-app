import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/common/GlobalColors.dart';
import 'package:iquit/home/PieChart.dart';

class CircleTimer extends StatelessWidget {
  String _displayText;

  CircleTimer(String textSent) {
    this._displayText = textSent ?? "No Streak Initialized inner";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        height: 230,
        decoration: new BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: -5,
                  blurRadius: 7,
                  offset: Offset(-7, -7),
                  color: GlobalColors.GREY.color),
              BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 7,
                  offset: Offset(7, 7),
                  color: Colors.black)
            ]),
        padding: EdgeInsets.all(20),
        child: Container(
          width: 50,
          height: 50,
          decoration: new BoxDecoration(
              color: GlobalColors.DEFAULT_GREY.color, shape: BoxShape.circle),
          child: Center(
            child: Text(_displayText), //TODO REST
          ),
        ));
  }
}
