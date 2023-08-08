import 'package:flutter/material.dart';
import 'package:evaluation_one/navigation/navigation_provider.dart';
import 'package:evaluation_one/utils/string.dart';

class NamedRouteTwo extends StatelessWidget {
  const NamedRouteTwo({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(screenTwo),
        Center(
          child: ElevatedButton(
            onPressed: () {
              NavigationProvider.pushToThirdScreen(context);
            },
            child: const Text(gotoRouteThree),
          ),
        ),
        Text('Received $value'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Iam from screen 2');
          },
          child: const Text(passvaluetoFirst),
        ),
      ]),
    );
  }
}
