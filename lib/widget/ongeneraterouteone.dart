import 'package:flutter/material.dart';

class OngenerateRouteOne extends StatelessWidget {
  const OngenerateRouteOne({super.key});
  final dynamicData = "Hello from source!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OngenerateRouteOne'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/screentwo', arguments: dynamicData);
          },
          child: const Text('Go to screen 2'),
        ),
      ),
    );
  }
}
