import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Cubit<List<Event>> {
  EventBloc() : super([]);

  // void addEvent(DateTime date, Event event) {

  void addEvent(Event event) {
    print('date${event.eventdate}');
    print('event${event.time}');
    print('event name${event.name}');

    // final Map<DateTime, List<Event>> event;
    List<Event> updatedEvents=[];

    updatedEvents.add(event);
    print('updatedEvents$updatedEvents');
    emit(updatedEvents);

    

    // emit(updatedEvents);
    // updatedEvents.add(date);
    // final updatedEvents=Map.from(state);

    // final updatedEvents = Map.from(state);
    // if (updatedEvents[date] == null) {
    //   updatedEvents[date] = [];
    // }
    // updatedEvents[date]!.add(event);
    // emit(updatedEvents[date]);
  }
}

class Event {
  final String name;
  final DateTime time;
  final DateTime eventdate;

  Event(this.name, this.time,this.eventdate);
}

