import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customcal.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomEventBloc>(
          create: (context) => CustomEventBloc(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calendar and Events',
        home: CustomCal(),
      ),
    );
  }
}


