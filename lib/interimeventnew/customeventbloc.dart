import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class CustomEventBloc extends Bloc<CustomEvent, CustomState> {
  CustomEventBloc() : super(ItemLoadingState()) {
    on<ItemAddingEvent>((event, emit) {
      emit(ItemLoadingState());
      listData[event.index] = event.event;
      final List<Event> updatedList = listData;
      emit(ItemLoadedState(updatedList));
    });

    on<TimeAddingEvent>((event, emit) {
      emit(TimeChangeState(parseTime(event.selectedTime)));
    });

  }
    String parseTime(TimeOfDay time) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }

  List<Event> listData = List.generate(30, (index) {
    final bool randomBool = Random().nextBool();
    return Event('', '', index + 1, randomBool);
  });
}

class Event {
  final String name;
  final String time;
  final int eventdate;
  final bool isTrue;

  Event(this.name, this.time, this.eventdate, this.isTrue);
}

abstract class CustomState {}

class ItemLoadedState extends CustomState {
  final List<Event> eventList;
  ItemLoadedState(this.eventList);
}

class ItemLoadingState extends CustomState {}

class TimeChangeState extends CustomState {
  final String selectedTime;
  TimeChangeState(this.selectedTime);
}

abstract class CustomEvent {}

class ItemAddingEvent extends CustomEvent {
  final Event event;
  final int index;
  ItemAddingEvent(this.event, this.index);
}

class TimeAddingEvent extends CustomEvent {
  final TimeOfDay selectedTime;
  TimeAddingEvent(this.selectedTime);
}
