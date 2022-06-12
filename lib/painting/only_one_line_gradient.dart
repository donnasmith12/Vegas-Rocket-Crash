import 'dart:math';

import 'package:flutter/material.dart';

class GradientSmoothLinePainter extends CustomPainter {
  final Color lineColor;
  final List<double> values;

  GradientSmoothLinePainter(this.lineColor, this.values);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ..color = lineColor
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                lineColor,
                lineColor.withOpacity(0.9),
                lineColor.withOpacity(0.7),
                lineColor.withOpacity(0.5),
                lineColor.withOpacity(0.3),
                lineColor.withOpacity(0.1),
              ],
            ).createShader(
              // const Rect.fromLTRB(0, 30, 10, 10),
              Rect.fromLTWH(0.0, 0.0, size.width, size.height),
              );

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
    path.lineTo(xValue - xAxisStep, size.height);
    path.close();
    canvas.drawPath(path, paint);


    //сначала градиент, а теперь саму линию

    final paint2 = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path2 = Path();

    xValue = 0;

    for (var i = 0; i < values.length; i++) {
      final value = values[i];
      final yValue = yHeight == 0
          ? (0.5 * size.height)
          : ((yMax - value) / yHeight) * size.height;
      if (xValue == 0) {
        path2.moveTo(xValue, yValue);
      } else {
        final previousValue = values[i - 1];
        final xPrevious = xValue - xAxisStep;
        final yPrevious = yHeight == 0
            ? (0.5 * size.height)
            : ((yMax - previousValue) / yHeight) * size.height;
        final controlPointX = xPrevious + (xValue - xPrevious) / 2;
        // HERE is the main line of code making your line smooth
        path2.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue, yValue);
      }
      xValue += xAxisStep;
    }
    canvas.drawPath(path2, paint2);
  }

@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}