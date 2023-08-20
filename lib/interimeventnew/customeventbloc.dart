import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEventBloc extends Bloc<CustomEvent, CustomState> {

  CustomEventBloc() : super(ItemLoadingState()) {
    on<ItemAddingEvent>((event, emit) {
      emit(ItemLoadingState());
      listData[event.index] = event.event;
      final List<Event> updatedList = listData;
      emit(ItemLoadedState(updatedList));
    });
  }

  List<Event> listData = List.generate(30, (index) {
    return Event('', '', index +1);
  });

  
}

class Event {
  final String name;
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


abstract class CustomEvent {}

class ItemAddingEvent extends CustomEvent {
  final Event event;
  final int index;
  ItemAddingEvent(this.event, this.index);
}
