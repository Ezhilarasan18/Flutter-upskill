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
        CustomPaint(
          size: Size(customHeight, customWidth),
          painter: SpeedometerPainter(value, minSpeed, maxSpeed, arcCount),
          foregroundPainter: ReadingValue(),
        ),
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
