import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// State
class CounterState {
  final int count;

  CounterState(this.count);
}

// Bloc
// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterState(0));

//   // @override
//   Stream<CounterState> mapEventToState(CounterEvent event) async* {
//     if (event is IncrementEvent) {
//       yield CounterState(state.count + 1);
//     } else if (event is DecrementEvent) {
//       yield CounterState(state.count - 1);
//     }
//   }
// }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}

