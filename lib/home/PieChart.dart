import 'package:flutter/material.dart';
import 'package:iquit/common/GlobalColors.dart';
import 'package:iquit/home/TimerPainter.dart';

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    double _localHeight = MediaQuery.of(context).size.width;//TODO FIND A WAY TO DIVIDE THE SCREEN IN 3
    return Container(
          height: 350, //TODO: CHANGE LATTER TO DYNAMIC HEIGHT
          padding: new EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              decoration: BoxDecoration(
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
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                        width: constraints.maxWidth * 0.5,
                        height: constraints.maxHeight * 0.5,
                        child: CustomPaint(
                          child: Center(),
                          foregroundPainter:
                              TimerPainter(width: constraints.maxWidth),
                        )),
                  )
                ],
              ),
            ),
        ));
  }
}
