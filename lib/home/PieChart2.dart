import 'package:flutter/material.dart';
import 'package:iquit/common/GlobalColors.dart';
import 'package:iquit/home/TimerPainter.dart';

class PieChart2 extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test2'),
        ),
        body: Container(
            padding: new EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                          width: constraints.maxWidth * 0.6,
                          child: CustomPaint(
                            child: Center(),
                            foregroundPainter:
                                TimerPainter(width: constraints.maxWidth * 0.5),
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}
