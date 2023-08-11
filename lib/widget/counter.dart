import 'package:evaluation_one/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/counterscreentwo.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  dynamic counterBloc;
  late dynamic _streamSubscription;

  @override
  void initState() {
  counterBloc = CounterBloc();
      _streamSubscription = counterBloc.counterStream.listen(
      (data) {
        // Do something with the stream data
        print(data);
      },
      onError: (error) {
        // Handle error
        print('Stream error: $error');
      },
      onDone: () {
        // Stream is done emitting data
        print('Stream done');
      },
    );
    print('result$_streamSubscription');
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // final counterBloc=CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc example'),
      ),
      body:
      // Hero(tag: 123, child: child),
       Column(
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
              TextButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Increment);
                },
                child: const Icon(Icons.add),
              ),
              TextButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Decrement);
                },
                child: const Icon(Icons.remove),
              ),
              TextButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Reset);
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          ElevatedButton(
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
