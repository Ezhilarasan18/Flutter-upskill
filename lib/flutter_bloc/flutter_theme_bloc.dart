import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class ThemeBloc extends Cubit<ThemeData> {
  ThemeBloc() : super(lightTheme);

  void toggleTheme() {
    if (state == lightTheme) {
      emit(darkTheme);
    } else {
      emit(lightTheme);
    }
  }
}

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();

