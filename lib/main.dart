import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Semicircle Speedometer'),
        ),
        body: Center(
          child: Speedometer(),
        ),
      ),
    );
  }
}


class Speedometer extends StatefulWidget {
  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double value = 5; // Default value
  final double minSpeed = 5;
  final double maxSpeed = 35;
  final int arcCount = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(200, 200),
          painter: SpeedometerPainter(value, minSpeed, maxSpeed, arcCount),
        ),
        SizedBox(height: 20),
        Text(
          'Speed: ${value.toStringAsFixed(1)}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter Speed',
          ),
          onChanged: (input) {
            setState(() {
              value = double.tryParse(input) ?? minSpeed;
              if (value < minSpeed) value = minSpeed;
              if (value > maxSpeed) value = maxSpeed;
            });
          },
        ),
      ],
    );
  }
}

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

    final totalArcWidth = pi; // Total width of the semicircle
    final spaceBetweenArcs = totalArcWidth / (arcCount - 1); // Space between arcs
    final arcWidth = spaceBetweenArcs - 0.1; // Adjusted width of each arc

    for (int i = 0; i < arcCount; i++) {
      final arcStart = -pi / 0.92 + (i * spaceBetweenArcs);
      final arcEnd = arcStart + arcWidth;

      final paint = Paint()
        ..strokeWidth = 15
        ..style = PaintingStyle.stroke;

      if (i < arcCount ~/ 2) {
        // Left side arcs (Red color)
        paint.color = Colors.red;
      } else {
        // Right side arcs (Green color)
        paint.color = Colors.green;
      }

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerYArcs), radius: radius),
        arcStart,
        arcEnd - arcStart,
        false,
        paint,
      );
    }

    final needlePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final needleAngle = -pi / 1 + ((value - minSpeed) / (maxSpeed - minSpeed)) * pi;

    canvas.drawLine(
      Offset(centerX, centerYNeedle),
      Offset(
        centerX + radius * 0.8 * cos(needleAngle),
        centerYNeedle + radius * 0.8 * sin(needleAngle),
      ),
      needlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


