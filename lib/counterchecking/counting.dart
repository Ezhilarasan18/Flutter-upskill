// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/counterchecking/countingbloc.dart';

// class Counting extends StatelessWidget {
//   const Counting({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter BLoC Example')),
//       body: Center(
//         child: BlocConsumer<CountingBloc, CounterState>(
//           listener: (context, state) {
//             // Listen for state changes and perform actions if needed
//           },
//           listenWhen: (previous, current)  {


//             return true;
//           },
//           buildWhen: (previous, current) {
//             return false;
//           },
//           builder: (context, state) {
//             if (state is UpdatedState) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Value: ${state.value}'),
//                  const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () => context.read<CountingBloc>().add(IncrementEvent()),
//                     child: const Text('Increment'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => context.read<CountingBloc>().add(DecrementEvent()),
//                     child: const Text('Decrement'),
//                   ),
//                 ],
//               );
//             }
//             return const Text('Loading...');
//           },
//         ),
//       ),
//     );
//   }
// }
