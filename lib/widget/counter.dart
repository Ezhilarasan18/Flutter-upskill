import 'package:evaluation_one/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/counterscreentwo.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // dynamic counterBloc;
  // @override
  // void initState() {
  // counterBloc = CounterBloc();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final counterBloc=CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Increment);
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Decrement);
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Reset);
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  CounterScreenTwo(bloc:counterBloc)),
                );
              },
              child: const Text('Go to screen2'))
        ],
      ),
    );
  }
}
