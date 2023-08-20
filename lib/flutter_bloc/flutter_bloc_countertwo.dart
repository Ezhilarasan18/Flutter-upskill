import 'package:flutter/material.dart';
class Flutterbloccountertwo extends StatelessWidget {
  const Flutterbloccountertwo({super.key});
  // final BlocProvider bloc;
  @override
  Widget build(BuildContext context) {
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    // int blocValue = BlocProvider.of<CounterBloc>(context).getStateValue();
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    // print('abc${counterBloc.state}');
    // int blocValue = 

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc Counter')),
      body: const Center(
        child: Text('data')
        // BlocBuilder<CounterBloc, CounterState>(
        //   builder: (context, state) {
        //     return const Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //          Text(
        //           'Counter Value:',
        //           style: TextStyle(fontSize: 18),
        //         ),
        //         Text(
        //           // '${state.count}',
        //           'dfdfdfd'
        //           // style:const TextStyle(fontSize: 32),
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     TextButton(
      //       onPressed: () => counterBloc.add(IncrementEvent()),
      //       child: const Icon(Icons.add),
      //     ),
      //     const SizedBox(height: 10),
      //     TextButton(
      //       onPressed: () => counterBloc.add(DecrementEvent()),
      //       child:const Icon(Icons.remove),
      //     ),
      //   ],
      // ),
    );
  }
}
