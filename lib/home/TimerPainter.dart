import 'package:flutter/material.dart';

import 'dart:math';

class TimerPainter extends CustomPainter {
  static final double _RADIUS_MULTIPLYER = 1.25;
  static final double _RING_THICKNESS_MULTIPLYER = 25;

  TimerPainter({@required this.width});

  final double width;

  List<Color> localColors = new List();

  void setColors() {
    localColors.add(Colors.green);
    localColors.add(Colors.red);
    localColors.add(Colors.blue);
    localColors.add(Colors.yellow);
    localColors.add(Colors.orange);
  }

  @override
  void paint(Canvas canvas, Size size) {
    setColors();//TODO REMOVE THIS WHEN THE LIST IS READY
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 1, size.height / 1);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = (width / 100) * 2.02;

    double total = 100;
    double startRadian = -pi / 10;

    for (var index = 0; index < localColors.length; index++) {
      final Color currentColor = localColors[index];
      final double sweepRadian = 20 / total * 2 * pi;
      paint.color = currentColor;

      canvas.drawArc(Rect.fromCircle(radius: radius, center: center),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
