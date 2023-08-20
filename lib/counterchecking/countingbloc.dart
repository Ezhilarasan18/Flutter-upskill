// import 'package:bloc/bloc.dart';

// class CountingBloc extends Bloc<CounterEvent, CounterState> {
//   CountingBloc() : super(InitialState());

//   // @override
//   Stream<CounterState> mapEventToState(CounterEvent event) async* {
//     if (event is IncrementEvent) {
//       yield UpdatedState((state as UpdatedState).value + 1);
//     } else if (event is DecrementEvent) {
//       yield UpdatedState((state as UpdatedState).value - 1);
//     }
//   }
// }


// abstract class CounterEvent {}

// class IncrementEvent extends CounterEvent {}
// class DecrementEvent extends CounterEvent {}

// abstract class CounterState {}

// class InitialState extends CounterState {}

// class UpdatedState extends CounterState {
//   final int value;
//   UpdatedState(this.value);
// }

