import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';
import 'package:evaluation_one/widget/flutter_bloc_home.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_theme_bloc.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(
          create: (context) => ItemBloc(apiService)..fetchItems(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'BLoC CRUD Example with Dark Theme',
            theme: theme,
            home: const BlocHomeScreen(),
          );
        },
      ),
    );
  }
}



