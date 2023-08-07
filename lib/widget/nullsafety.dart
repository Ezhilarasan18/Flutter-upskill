import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NullSafety extends StatefulWidget{
  const NullSafety({super.key});

  @override
  State<NullSafety> createState() => _NullSafetyState();
}

class _NullSafetyState extends State<NullSafety> {
 String? a='ggg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('hgjhg'),
      ),
      body:  Center(
        child:  Text('$a'),
      ),
    ); 
  }
}