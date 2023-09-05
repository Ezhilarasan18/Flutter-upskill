import 'package:flutter/material.dart';
import 'package:evaluation_one/speedometer/speedometer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Semicircle Speedometer'),
        ),
        body: const Center(
          child: Speedometer(),
        ),
      ),
    );
  }
}





