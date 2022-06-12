import 'dart:math';

import 'package:flutter/material.dart';

class OneLinePlusVerticalPainter extends CustomPainter {
  final Color lineColor;
  final List<double> values;

  OneLinePlusVerticalPainter(this.lineColor, this.values);

  @override
  void paint(Canvas canvas, Size size) {

final verticalPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    final verticalPath = Path();

    final paint = Paint()
      ..color = lineColor
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
            verticalPath.moveTo(xValue, yValue);
            verticalPath.lineTo(xValue, size.height);
      }
      xValue += xAxisStep;
    }
    canvas.drawPath(path, paint);
    canvas.drawPath(verticalPath, verticalPaint);
  }

@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}