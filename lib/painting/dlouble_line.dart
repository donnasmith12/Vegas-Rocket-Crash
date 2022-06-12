import 'dart:math';

import 'package:flutter/material.dart';

class DoubleSmoothLinePainter extends CustomPainter {
  final Color lineColor;
  final List<double> values;

  DoubleSmoothLinePainter(this.lineColor, this.values);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final path = Path();

    final yMin = 0.0; //values.reduce(min);
    final yMax = 10.0; //values.reduce(max);
    final yHeight = yMax - yMin;
    final xAxisStep = size.width / 10; //values.length;
    var xValue = 0.0;
    for (var i = 0; i < values.length; i++) {
      final value = values[i];
      final yValue = yHeight == 0
          ? (0.5 * size.height)
          : ((yMax - value) / yHeight) * size.height;
      if (xValue == 0) {
        path.moveTo(xValue, yValue);
      } else {
        final previousValue = values[i - 1];
        final xPrevious = xValue - xAxisStep;
        final yPrevious = yHeight == 0
            ? (0.5 * size.height)
            : ((yMax - previousValue) / yHeight) * size.height;
        final controlPointX = xPrevious + (xValue - xPrevious) / 2;
        // HERE is the main line of code making your line smooth
        path.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue, yValue);
      }
      xValue += xAxisStep;
    }
    canvas.drawPath(path, paint);



    //add second line

    final paint2 = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

        final path2 = Path();

    final yMin2 = -1.0; //values.reduce(min);
    final yMax2 = 9.0; //values.reduce(max);
    final yHeight2 = yMax2 - yMin2;
    final xAxisStep2 = size.width / 10; //values.length;
    var xValue2 = 0.0;
    for (var i = 0; i < values.length; i++) {
      final value = values[i];
      final yValue = yHeight2 == 0
          ? (0.5 * size.height)
          : ((yMax2 - value) / yHeight2) * size.height;
      if (xValue2 == 0) {
        path2.moveTo(xValue2, yValue);
      } else {
        final previousValue = values[i - 1];
        final xPrevious = xValue2 - xAxisStep2;
        final yPrevious = yHeight2 == 0
            ? (0.5 * size.height)
            : ((yMax2 - previousValue) / yHeight2) * size.height;
        final controlPointX = xPrevious + (xValue2 - xPrevious) / 2;
        // HERE is the main line of code making your line smooth
        path2.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue2, yValue);
      }
      xValue2 += xAxisStep2;
    }
    canvas.drawPath(path2, paint2);
  }

@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}