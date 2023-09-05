import 'package:flutter/material.dart';
import 'dart:math';

class SpeedometerWidget extends StatelessWidget {
  final double userInput;

  SpeedometerWidget({required this.userInput});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:const Size(200, 200), // Adjust the size as needed
      painter: SpeedometerPainter(userInput: userInput),
    );
  }
}

class SpeedometerPainter extends CustomPainter {
  final double userInput;

  SpeedometerPainter({required this.userInput});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height;

    final double radius = size.height;
    final double startAngle = pi;
    final double endAngle = 0;

    final Paint outerCirclePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final Paint innerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Paint needlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      endAngle,
      false,
      outerCirclePaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - 10),
      startAngle,
      endAngle,
      false,
      innerCirclePaint,
    );

    
    for (int i = 0; i <= 180; i += 30) {
      final angle = startAngle + (i * (pi / 180));
      final tickStartX = centerX + (radius - 20) * cos(angle);
      final tickStartY = centerY + (radius - 20) * sin(angle);
      final tickEndX = centerX + (radius - 10) * cos(angle);
      final tickEndY = centerY + (radius - 10) * sin(angle);

      canvas.drawLine(
        Offset(tickStartX, tickStartY),
        Offset(tickEndX, tickEndY),
        outerCirclePaint,
      );
    }

    // Calculate and draw the needle
    final angle = startAngle+ (userInput / 35 * pi);
    final needleX = centerX + (radius - 25) * cos(angle);
    final needleY = centerY + (radius - 25) * sin(angle);

    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(needleX, needleY),
      needlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}