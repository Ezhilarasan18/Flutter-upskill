import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customcal.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:evaluation_one/watchlist/watchlisthome.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';


void main() {
  runApp(const MyApp());
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider<CustomEventBloc>(
//         create: (context) => CustomEventBloc(),
//         child: const MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: CustomCal(),
//         ),
//       ),
//     );
//   }
// }




class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (context) => TabBarBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DynamicTabBarWidget(),
      ),
    );
  }
}
