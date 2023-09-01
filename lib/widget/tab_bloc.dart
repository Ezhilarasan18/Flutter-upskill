// import 'package:flutter_bloc/flutter_bloc.dart';

// // Events
// abstract class TabEvent {}

// class UpdateTabEvent extends TabEvent {
//   final List<String> selectedItems;

//   UpdateTabEvent(this.selectedItems);
// }

// // State
// class TabState {
//   final List<String> selectedItems;

//   TabState(this.selectedItems);
// }

// // Bloc
// class TabBloc extends Bloc<TabEvent, TabState> {
//   TabBloc() : super(TabState([]));

//   @override
//   Stream<TabState> mapEventToState(TabEvent event) async* {
//     if (event is UpdateTabEvent) {
//       yield TabState(event.selectedItems);
//     }
//   }
// }
