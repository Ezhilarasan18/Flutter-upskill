import 'package:flutter/material.dart';
import 'package:evaluation_one/bloc/counter_bloc.dart';


// ignore: must_be_immutable
class CounterScreenTwo extends StatefulWidget{
  const CounterScreenTwo({super.key});

  @override
  State<CounterScreenTwo> createState() => _CounterScreenTwoState();
}

class _CounterScreenTwoState extends State<CounterScreenTwo> {
  final counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Second screen'),
      ),
      body:   Center(
        child:  StreamBuilder(
              // initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              }),
      ),
    ); 
  }
}