import 'package:flutter/material.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.only(top: 400.0,left: 120), 
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go to Route1'),
                ),
                // Text('Received value: $value')
          ],
          
        ),
         
      ),
    );
  }
}
