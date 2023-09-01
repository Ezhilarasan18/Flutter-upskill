import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/watchlisthome.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (context)=>TabBarBloc(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicTabBarWidget(),
    )
    );
  }
}


