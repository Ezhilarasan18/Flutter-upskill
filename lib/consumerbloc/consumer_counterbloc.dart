import 'package:flutter_bloc/flutter_bloc.dart';

// BLoC States
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterUpdated extends CounterState {
  final int count;

  CounterUpdated(this.count);
}

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterInitial());

  int _count = 0;

  void increment() {
    _count++;
    emit(CounterUpdated(_count));
  }
}
