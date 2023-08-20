// import 'package:flutter/material.dart';
// import 'package:evaluation_one/bloc/counter_bloc.dart';

// // ignore: must_be_immutable
// class CounterScreenTwo extends StatefulWidget {
//   const CounterScreenTwo({super.key, required this.bloc});
//   final CounterBloc bloc;
//   @override
//   State<CounterScreenTwo> createState() => _CounterScreenTwoState();
// }

// class _CounterScreenTwoState extends State<CounterScreenTwo> {
//   dynamic counterBloc;
//   // dynamic _streamSubscription;
//   late dynamic _streamSubscription;
//   @override
//   void initState() {
//     super.initState();

//     // widget.bloc.counterStream.listen((event) {
//     //   print('Event received$event');
//     // });

//      _streamSubscription = widget.bloc.counterStream.listen(
//       (data) {
//         // Do something with the stream data
//       },
//       onError: (error) {
//         // Handle error
//       },
//       onDone: () {
//         // Stream is done emitting data
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final counterBloc=CounterBloc();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second screen'),
//       ),
//       body: Center(
//           child:
//           // Hero(tag: 123, child: Text('${widget.bloc.counter}'),)
//               Text('${widget.bloc.counter}')
//               ),
//     );
//   }
// }
