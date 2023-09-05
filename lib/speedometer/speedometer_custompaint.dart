import 'package:flutter/material.dart';
import 'dart:math';

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
