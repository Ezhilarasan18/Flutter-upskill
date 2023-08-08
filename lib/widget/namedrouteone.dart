import 'package:evaluation_one/widget/namedroutetwo.dart';
import 'package:flutter/material.dart';
import 'package:evaluation_one/navigation/navigation_provider.dart';
import 'package:evaluation_one/utils/string.dart';

class NamedRouteOne extends StatefulWidget {
  const NamedRouteOne({super.key});

  @override
  State<NamedRouteOne> createState() => _NamedRouteOneState();
}

class _NamedRouteOneState extends State<NamedRouteOne> {
  String? receivedValue;

  _goToScreenTwo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const NamedRouteTwo(value: 'I am from screen1')),
    );
    if (result != null) {
      setState(() {
        receivedValue = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(screenOne),
          Center(
            child: ElevatedButton(
                onPressed: _goToScreenTwo, child: const Text(gotoRouteTwo)),
          ),
          receivedValue != null
              ? Text('Received value:  $receivedValue')
              : const Text(yettoReceive),

          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                NavigationProvider.pushToSecondScreen(context);
              },
              child: const Text(gotoRouteTwo)),
          const SizedBox(
            height: 50,
          ),

          // TextButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/second');
          //     },
          //     child: const Text('Go to Route 2')),
        ],
      ),
    );
  }
}
