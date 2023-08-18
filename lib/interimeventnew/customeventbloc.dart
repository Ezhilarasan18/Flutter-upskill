import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEventBloc extends Cubit<List<Event>> {
  CustomEventBloc() : super([]);


    List<Event> updatedEvents=[];
  void addEvent(Event event) {
    updatedEvents.add(event);
    print('updatedEvents$updatedEvents');
    emit(updatedEvents);
  }
}

class Event {
  final String name;
  final DateTime time;
  final int eventdate;

  Event(this.name, this.time,this.eventdate);
}

