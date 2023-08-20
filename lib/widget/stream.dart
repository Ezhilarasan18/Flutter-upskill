import 'package:flutter/material.dart';
import 'dart:async';

class StreamClass extends StatefulWidget{
  const StreamClass({super.key});

  @override
  State<StreamClass> createState() => _StreamClassState();
}

class _StreamClassState extends State<StreamClass> {
  StreamController<double>controller=StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
        mainAxisSize:MainAxisSize.min,
          children: [
            MaterialButton(
              color: Colors.red,
              onPressed: (){
                Stream stream=controller.stream;
                stream.listen((value) { 
                });
              },
              child: const Text('Subscribe'),
              ),
              MaterialButton(onPressed: (){
                controller.add(12);
              },
              color: Colors.green,
              child: const Text('Emit value'),
              )
          ],
        ),
      ),
    );
  }
}