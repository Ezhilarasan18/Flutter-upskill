import 'package:flutter/material.dart';
import 'package:evaluation_one/mobx/counter/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key,required this.countervalue});
  final CounterStore countervalue;
  // Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text('${countervalue}'),
            Observer(
              builder: (context) {
                return Text('${countervalue.counter}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                countervalue.increment();
              },
              child: Text('Increment Counter'),
            ),
            ElevatedButton(
              onPressed: () {
                countervalue.decrement();
                // Use the increment action to modify the state.
              },
              child: Text('Decrement Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
