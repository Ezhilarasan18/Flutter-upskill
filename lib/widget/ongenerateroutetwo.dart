import 'package:flutter/material.dart';

class OngenerateRouteTwo extends StatelessWidget{
  const OngenerateRouteTwo({super.key,required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    final arrayData = ['Item 1', 'Item 2', 'Item 3'];
    return Scaffold(
      appBar: AppBar(title: const Text('OngenerateRouteTwo'),),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/screenthree',arguments:arrayData );
              },
              child: const Text('Go to screen 3'),
              
            ),
            
          ),
          Text(value)
        ],
      ),
      
    );
  }
}