import 'package:flutter/material.dart';
import 'package:evaluation_one/utils/string.dart';

class NamedRouteThree extends StatelessWidget {
  const NamedRouteThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.only(top: 400.0,left: 120), 
        child: Column(
          children: [
                const Text(screenThree),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(gotoRouteTwo),
                ),
                // Text('Received value: $value')
            const SizedBox(height: 50,),

            TextButton(
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/'));
              }, 
            child: const Text(gotoFirstScreen),
            ),
          ],
          
        ),
         
      ),
    );
  }
}
