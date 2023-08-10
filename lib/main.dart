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
import 'package:evaluation_one/widget/ongeneraterouteone.dart';
import 'package:evaluation_one/widget/ongenerateroutetwo.dart';
import 'package:evaluation_one/widget/ongenerateroutethree.dart';
import 'package:evaluation_one/widget/counter.dart';
import 'package:evaluation_one/widget/productscreen.dart';
import 'package:evaluation_one/provider/taskprovider.dart';
import 'package:evaluation_one/widget/tasklistscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';



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
        // home: const CounterPage()
        // home:const TaskScreen()

        // home: const Counter()
        // home:const ProductScreen()
        // home: const Abc()
        home: ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const TaskListScreen(),
      ),


        

        // NamedRoute example

        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const NamedRouteOne(),
        //   '/second': (context) => const NamedRouteTwo(value: 'I am from screen1'),
        //   '/third': (context) => const NamedRouteThree(),
        // },

        // onGenereateRoute

        // onGenerateRoute: (settings) {
        //   if (settings.name == '/screentwo') {
        //     // to get a value as string
        //     final dynamicData = settings.arguments as String;
        //     return MaterialPageRoute(
        //       builder: (context) => OngenerateRouteTwo(value: dynamicData),
        //     );
        //   }
        //    if (settings.name == '/screenthree') {
        //     final arrayData=settings.arguments as List;
        //     return MaterialPageRoute(
        //       builder: (context) =>  OngenerateRouteThree(value:arrayData),
        //     );
        //   }
        //   return null;
        // },
        // home: const OngenerateRouteOne(),
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


