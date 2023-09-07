import 'package:flutter/material.dart';
import 'package:evaluation_one/speedometer/speedometer_custompaint.dart';

class Speedometer extends StatefulWidget {
  const Speedometer({super.key});
  @override
  State<Speedometer> createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double value = 5; // Default value
  final double minSpeed = 5;
  final double maxSpeed = 35;
  final int arcCount = 6;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double customHeight = screenHeight * 0.24;
    double customWidth = screenWidth * 0.62;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Speedometer_Widget(
            customHeight: customHeight,
            customWidth: customWidth,
            value: value,
            minSpeed: minSpeed,
            maxSpeed: maxSpeed,
            arcCount: arcCount),
        const SizedBox(height: 20),
        Text(
          'Speed: ${value.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
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

// ignore: camel_case_types
class Speedometer_Widget extends StatelessWidget {
  Speedometer_Widget({
    super.key,
    required this.customHeight,
    required this.customWidth,
    required this.value,
    required this.minSpeed,
    required this.maxSpeed,
    required this.arcCount,
  });

  final double customHeight;
  final double customWidth;
  final double value;
  final double minSpeed;
  final double maxSpeed;
  final int arcCount;
  final Color needleColor = Colors.black;
  final Color leftarcColor = Colors.red;
  final Color rightarcColor = Colors.green;

  final List readingValues = ['S3', 'S2', 'S1', 'R3', 'R2', 'R1'];
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(customHeight, customWidth),
      painter: SpeedometerPainter(value, minSpeed, maxSpeed, arcCount,
          needleColor, leftarcColor, rightarcColor),
      foregroundPainter: ReadingValue(readingValues),
    );
  }
}
