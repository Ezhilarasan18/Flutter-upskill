import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/watchlisthome.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/apibloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return  MultiBlocProvider(
      providers: [
        BlocProvider<TabBarBloc>(
          create: (context) => TabBarBloc(),
        ),
         BlocProvider<ApiBloc>(
          create: (context) => ApiBloc(),
        ),
      ],
      child: const MaterialApp(
        home: DynamicTabBarWidget(),
      ),
    );
  }
}
