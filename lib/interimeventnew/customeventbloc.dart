import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomEventBloc extends Cubit<ItemState> {
//   CustomEventBloc() : super(ItemLoadingState());

//   List<Event> updatedEvents = [];
//   void addEvent(Event event) {
//     updatedEvents.add(event);
//     print('updatedEvents${updatedEvents.last.time}');
//     emit(ItemLoadedState(updatedEvents));
//   }
// }

class CustomEventBloc extends Bloc<CustomEvent, CustomState> {
  // List<Event> myList = generateList();

  CustomEventBloc() : super(ItemLoadingState()) {
    on<ItemAddingEvent>((event, emit) {
      print('mapEventToState${event.event.name}');
      print('mapEventToState eventdate${event.event.eventdate}');
      print('mapEventToState time${event.event.time}');

      emit(ItemLoadingState());
      listData[event.index] = event.event;
      final List<Event> updatedList = listData;
      emit(ItemLoadedState(updatedList));
    });
  }

  List<Event> listData = List.generate(30, (index) {
    return Event('', '', index + 1);
  });

  // @override
  Stream<CustomState> mapEventToState(CustomEvent event) async* {
    print('mapEventToState');
    if (event is ItemAddingEvent) {
      print('mapEventToState');
      listData[event.index] = event.event;
      final List<Event> updatedList = listData;
      yield ItemLoadedState(updatedList);
    }
   
  }
}

class Event {
  final String name;
  // final DateTime time;
  final String time;
  final int eventdate;

  Event(this.name, this.time, this.eventdate);
}

abstract class CustomState {}

class ItemLoadedState extends CustomState {
  final List<Event> eventList;
  ItemLoadedState(this.eventList);
}

class ItemLoadingState extends CustomState {}

class ItemInitialState extends CustomState {}

abstract class CustomEvent {}

class ItemAddingEvent extends CustomEvent {
  final Event event;
  final int index;
  ItemAddingEvent(this.event, this.index);
}
