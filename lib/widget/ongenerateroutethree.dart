import 'package:flutter/material.dart';

class OngenerateRouteThree extends StatelessWidget {
  const OngenerateRouteThree({super.key, required this.value});
  final List value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OngenerateRouteThree'),
      ),
      body: Center(
        child: Column(
          children: [
            for (var item in value) Text(item),
          ],
        ),
      ),
    );
  }
}
