import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/routeone.dart';
import 'package:evaluation_one/widget/namedroutethree.dart';
import 'package:evaluation_one/widget/namedrouteone.dart';
import 'package:evaluation_one/widget/namedroutetwo.dart';
import 'package:evaluation_one/widget/ongeneraterouteone.dart';
import 'package:evaluation_one/widget/ongenerateroutetwo.dart';
import 'package:evaluation_one/widget/ongenerateroutethree.dart';

void main() {
  runApp(MyApp());
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


      // MaterialPageRoute example-uncommand  the below line

      // home:const RouteOne()
     

      // NamedRoute example -uncommand  the below line

      initialRoute: '/',
      routes: {
        '/': (context) => const NamedRouteOne(),
        '/second': (context) => const NamedRouteTwo(value: 'I am from screen1'),
        '/third': (context) => const NamedRouteThree(),
      },  
    );
  }
}

