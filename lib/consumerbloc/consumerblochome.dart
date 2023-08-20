import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/consumerbloc/consumer_counterbloc.dart';

class Consumerblochome extends StatelessWidget {
   const Consumerblochome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocConsumer Example with BlocProvider'),
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterUpdated) {
              return Text('Count: ${state.count}');
            }
            return const Text('Loading...');
          },
          listener: (context, state) {
            if (state is CounterUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Count: ${state.count}')),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().increment();
        },
        child:const Icon(Icons.add),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _counterBloc.close();
  //   super.dispose();
  // }
}