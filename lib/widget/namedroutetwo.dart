import 'package:flutter/material.dart';
import 'package:evaluation_one/navigation/navigation_provider.dart';

class NamedRouteTwo extends StatelessWidget {
  const NamedRouteTwo({super.key,required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
      children: [
      const  Text('SCREEN2'),
        Center(
          child: 
        ElevatedButton(
            onPressed: () {
              NavigationProvider.pushToThirdScreen(context);
            },
            child: const Text('Go to Route3'),
            ),
        ),
        Text('Received $value'),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
             Navigator.pop(context,'Iam from screen 2');
            },
            child: const Text('Pass value to firstscreen'),
            ),
      ]
      ),
    );
  }
}
