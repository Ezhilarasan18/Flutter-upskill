import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/watchlisthome.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/apibloc.dart';
// import 'package:evaluation_one/widget/tab.dart';
import 'package:evaluation_one/widget/abc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    // return MaterialApp(
    //   home: DynamicTabBarWidget(),
    // );
  //  return  MultiBlocProvider(
  //     providers: [
  //       BlocProvider<TabBarBloc>(
  //         create: (context) => TabBarBloc(),
  //       ),
  //        BlocProvider<ApiBloc>(
  //         create: (context) => ApiBloc(),
  //       ),
  //     ],
  //     child: const MaterialApp(
  //       home: DynamicTabBarWidget(),
  //     ),
  //   );

  return BlocProvider(
    create: (context)=>TabBarBloc(),
    child: const MaterialApp(
      home: DynamicTabBarWidget(),
    )
    );

  // return MaterialApp(
  //   home: Abc(),
  // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/widget/tab_bloc.dart';
// import 'package:evaluation_one/widget/first.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tab Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: BlocProvider(
//         create: (context) => TabBloc(),
//         child: FirstScreen(),
//       ),
//     );
//   }
// }

