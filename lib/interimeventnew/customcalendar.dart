import 'package:flutter/material.dart';

class Event {
  final DateTime date;
  final String eventName;

  Event(this.date, this.eventName);
}

class CustomCalendarMonth extends StatelessWidget {
  final List<Event> events;
  final DateTime selectedDate;

  CustomCalendarMonth({required this.events, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime(selectedDate.year, selectedDate.month, 1);
    DateTime endDate = DateTime(selectedDate.year, selectedDate.month + 1, 0);

    return Column(
      children: [
        TableCalendarHeader(),
        TableCalendarDaysOfWeek(),
        for (var date = startDate; date.isBefore(endDate); date = date.add(Duration(days: 1)))
          CustomCalendarDay(date: date, events: events),
      ],
    );
  }
}

class TableCalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              // Go to previous month
            },
          ),
          Text('Month Name Year'),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              // Go to next month
            },
          ),
        ],
      ),
    );
  }
}

class TableCalendarDaysOfWeek extends StatelessWidget {
  final List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var dayName in dayNames) Text(dayName),
      ],
    );
  }
}

class CustomCalendarDay extends StatelessWidget {
  final DateTime date;
  final List<Event> events;

  CustomCalendarDay({required this.date, required this.events});

  @override
  Widget build(BuildContext context) {
    List<Event> eventsForDay = events.where((event) => event.date.day == date.day).toList();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Text('${date.day}'),
          for (var event in eventsForDay) Text(event.eventName),
        ],
      ),
    );
  }
}

void main() {
  List<Event> events = [
    Event(DateTime(2023, 8, 18), 'Event 1'),
    Event(DateTime(2023, 8, 25), 'Event 2'),
    // Add more events
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Custom Calendar')),
      body: CustomCalendarMonth(events: events, selectedDate: DateTime.now()),
    ),
  ));
}
