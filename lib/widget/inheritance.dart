import 'package:flutter/material.dart';

class Bird extends StatelessWidget{
  const Bird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('class example'),
      )
    );
  }
}

class Parrot extends Bird{
  const Parrot({super.key});
  
  void speak(){
    print('The parrot can speak');
  }


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }}
