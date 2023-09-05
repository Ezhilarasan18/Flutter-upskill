import 'package:flutter/material.dart';
import 'package:evaluation_one/speedometer/speedometer_custompaint.dart';
class Speedometer extends StatefulWidget {
  const Speedometer({super.key});
  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double userInput = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semi-Circle Speedometer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpeedometerWidget(userInput: userInput),
           const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  userInput = double.tryParse(value) ?? 0.0;
                  userInput = userInput.clamp(0.0, 100.0); // Limit the input to 0-100
                });
              },
              decoration:const InputDecoration(
                labelText: 'Enter Value (0-35)',
              ),
            ),
          ],
        ),
      ),
    );
  }
}