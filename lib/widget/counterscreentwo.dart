import 'package:flutter/material.dart';
import 'package:evaluation_one/bloc/counter_bloc.dart';

// ignore: must_be_immutable
class CounterScreenTwo extends StatefulWidget {
  const CounterScreenTwo({super.key,required this.bloc});
final CounterBloc bloc;
  @override
  State<CounterScreenTwo> createState() => _CounterScreenTwoState();
}

class _CounterScreenTwoState extends State<CounterScreenTwo> {
  // dynamic counterBloc;
  // @override
  // void initState() {
  //   counterBloc = CounterBloc();
  //   counterBloc.counterStream.listen((event) {
  //     print(event);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final counterBloc=CounterBloc();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: 
        // StreamBuilder(
        //     // initialData: 0,
        //     stream: widget.bloc.counterStream,
        //     builder: (context, snapshot) {
        //       return Text('${snapshot.data}');
        //     }),
               Text('${widget.bloc.counter}')

      ),
    );
  }
}
