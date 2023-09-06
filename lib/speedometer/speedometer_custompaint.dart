import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:math' as math;
import 'package:evaluation_one/utils/string.dart';

class SpeedometerPainter extends CustomPainter {
  final double value;
  final double minSpeed;
  final double maxSpeed;
  final int arcCount;

  SpeedometerPainter(this.value, this.minSpeed, this.maxSpeed, this.arcCount);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerYArcs = size.height * 2 / 2.3; // Move only the arcs upwards
    final centerYNeedle = size.height; // Keep the needle at the bottom
    final radius = size.width / 2;

    const totalArcWidth = pi; // Total width of the semicircle
    final spaceBetweenArcs = totalArcWidth / (arcCount - 1); // Space between arcs
    final arcWidth = spaceBetweenArcs - 0.1; // Adjusted width of each arc

    for (int i = 0; i < arcCount; i++) {
      final arcStart = -pi / 0.92 + (i * spaceBetweenArcs);
      final arcEnd = arcStart + arcWidth;

      final paint = Paint()
        ..strokeWidth = 11
        ..style = PaintingStyle.stroke;

      if (i < arcCount ~/ 2) {
        // Left side arcs (Red color)
        paint.color = Colors.red;
      } else {
        // Right side arcs (Green color)
        paint.color = Colors.green;
      }

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerYArcs), radius: radius + 25),
        arcStart,
        arcEnd - arcStart,
        false,
        paint,
      );
    }

    final needlePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final needleAngle = -pi / 1 + ((value - minSpeed) / (maxSpeed - minSpeed)) * pi;

    // Calculate the starting and ending points of the needle
    final startX = centerX;
    final startY = centerYNeedle;
    final endX = centerX + radius * 1 * cos(needleAngle);
    final endY = centerYNeedle + radius * 0.8 * sin(needleAngle);

    // Draw the needle
    canvas.drawLine(
      Offset(startX, startY),
      Offset(endX, endY),
      needlePaint,
    );
    

    // Draw a small circle at the starting point of the needle
    final circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(startX, startY), 8, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ReadingValue extends CustomPainter {
  double pi = math.pi;


  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  double radianToDegree(double radian) {
    return radian * 180 / pi;
  }
//s3
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;

    final TextPainter textPainter = TextPainter(
        text: TextSpan(text:Constants.s3, style:const TextStyle(color: Colors.red)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter.paint(canvas, Offset(-40, size.height/0.99));



    // S2
    var dx = radius -
        (radius * math.cos(degreeToRadian(-20))) -
        48 * math.cos(degreeToRadian(1));
    var dy = radius -
        (radius * math.sin(degreeToRadian(-20))) -
        30 * math.tan(degreeToRadian(-45));
    var offsetS2 = Offset(dx, dy);
    final TextPainter textPainter2 = TextPainter(
        text: TextSpan(text:Constants.s2, style:const TextStyle(color: Colors.red)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width / 2);
    textPainter2.paint(canvas, offsetS2);

    //S1
    dx = radius -
        (radius * math.cos(degreeToRadian(50))) -
        25 * math.cos(degreeToRadian(1));
    dy = radius -
        (radius * math.sin(degreeToRadian(70))) -
        32 * math.tan(degreeToRadian(-70));
    var offsetS1 = Offset(dx, dy);
    final TextPainter textPainter3 = TextPainter(
        text: TextSpan(text:Constants.s1, style:const TextStyle(color: Colors.red)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter3.paint(canvas, offsetS1);

    //PIVOT
    dx = size.width / 2 - 20;
    dy = 65;
    var offsetp = Offset(dx, dy);
    final TextPainter textPainter4 = TextPainter(
        text: TextSpan(text: Constants.pivot, style: const TextStyle(color: Colors.black)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter4.paint(canvas, offsetp);


    // green readings

    //R3
    dx = size.width + 25;
    dy = size.height / 1;
    var offsetR3 = Offset(dx, dy);
    final TextPainter textPainter5 = TextPainter(
        text: TextSpan(text:Constants.r3, style:const TextStyle(color: Colors.green)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter5.paint(canvas, offsetR3);

    //R2
    dx = radius + (radius * math.cos(degreeToRadian(1)));
    dy = radius - (radius * math.sin(degreeToRadian(-140)));
    var offsetR2 = Offset(dx+25, dy);
    final TextPainter textPainter6 = TextPainter(
        text: TextSpan(text:Constants.r2, style:const TextStyle(color: Colors.green)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter6.paint(canvas, offsetR2);

    //R1
    dx = radius + (radius * math.cos(degreeToRadian(50)));
    dy = radius - (radius * math.sin(degreeToRadian(8)));
    var offsetR1 = Offset(dx, dy);
    final TextPainter textPainter7 = TextPainter(
        text: TextSpan(text: Constants.r1, style: const TextStyle(color: Colors.green)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter7.paint(canvas, offsetR1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
