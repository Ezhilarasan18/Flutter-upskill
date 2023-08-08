import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/isolate.dart';
import 'package:evaluation_one/widget/namedrouteone.dart';
import 'package:evaluation_one/widget/namedroutetwo.dart';
import 'package:evaluation_one/widget/stream.dart';
import 'package:evaluation_one/widget/stack.dart';
import 'package:evaluation_one/widget/nestedscroll.dart';
import 'package:evaluation_one/widget/inheritance.dart';
import 'package:evaluation_one/widget/customappbar.dart';
import 'package:evaluation_one/widget/nullsafety.dart';
import 'package:evaluation_one/widget/routeone.dart';
import 'package:evaluation_one/widget/namedroutethree.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo, 
      ),
      // home:const Loginscreen()
      // home:const MyHomePage()
      // home:const StreamClass()
      // home:const Stackexample()
      // home:const Nestedscroll()
      // home:const NullSafety()
      // MaterialPageRoute example
      // home:const RouteOne()

      // NamedRoute example

      initialRoute: '/',
      routes: {
        '/': (context) => const NamedRouteOne(),
        '/second': (context) =>  const NamedRouteTwo(value:'I am from screen1'),
        '/third': (context) => const NamedRouteThree(),
      },
    );  
  }
}

// CustomAppBar

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         appBar: CustomAppBar(height: 60.0), // Set your desired height here.
//         body: Center(
//           child: Text('Your App Content'),
//         ),
//       ),
//     );
//   }
// }


