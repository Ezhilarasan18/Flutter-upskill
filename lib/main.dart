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
import 'package:evaluation_one/provider/productprovider.dart';
import 'package:evaluation_one/widget/productlistscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:evaluation_one/flutter_bloc/counter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_bloc_counter.dart';
import 'package:evaluation_one/widget/apiexample.dart';
import 'package:evaluation_one/widget/flutter_bloc_crud.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/widget/flutter_bloc_home.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
         final apiService = ApiService();
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
        // home: const Counter()

        // home:const ProductScreen()

        //   home: ChangeNotifierProvider(
        //   create: (context) => ProductProvider(),
        //   child: const ProductListScreen(),
        // ),

        // home: BlocProvider(
        //   create: (context) => CounterBloc(),
        //   child: const Flutterbloccounter(),
        // ),

        // home: const ApiCallExample(),

        // home:const FlutterBloccrud()
              home: BlocProvider(
        create: (context) => ItemBloc(apiService)..fetchItems(),
        child:const BlocHomeScreen(),
      ),
        
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


