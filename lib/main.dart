import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evaluation_one/provider/productprovider.dart';
import 'package:evaluation_one/widget/productlistscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';
import 'package:evaluation_one/widget/flutter_bloc_home.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/widget/counter.dart';
import 'package:evaluation_one/flutter_bloc/flutter_theme_bloc.dart';
import 'package:evaluation_one/widget/productscreen.dart';


void main() {
  runApp( MyApp());
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
      // Provider-Uncommand the below line for provider
      home: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const ProductListScreen(),
      ),

      // BLoc pattern-uncommand the below line for bloc pattern

      // home:const ProductScreen()
     
    );
  }
}



