import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_bloc_countertwo.dart';

class Flutterbloccounter extends StatelessWidget {
  const Flutterbloccounter({super.key});
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    print('state${counterBloc.state}');

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc Counter')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter Value:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${state.count}',
                  style: const TextStyle(fontSize: 32),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => counterBloc.add(IncrementEvent()),
            // tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => counterBloc.add(DecrementEvent()),
            // tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          TextButton(
              onPressed: () {
                //        Navigator.push(
                // context,
                // PageRouteBuilder(
                //     pageBuilder: (context, animation, secondaryAnimation) =>
                //         const Flutterbloccountertwo (),
                // ));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const Flutterbloccountertwo(
                      // bloc:BlocProvider.of(context)
                    ),
                  ),
                );
              },
              child: const Text('Navigate'))
        ],
      ),
    );
  }
}
