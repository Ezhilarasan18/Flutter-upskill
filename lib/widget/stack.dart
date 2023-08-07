import 'package:flutter/material.dart';

class Stackexample extends StatelessWidget {
  const Stackexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.red,
            height: 100,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.green,
            height: 100,
          ),
        ),
      ],
    ));
  }
}
