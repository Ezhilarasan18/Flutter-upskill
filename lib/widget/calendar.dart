// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Calendar extends StatefulWidget {
//   const Calendar({super.key});
//   @override
//   State <Calendar> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<Calendar> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay=DateTime.now();
//   Map<DateTime, List<Event>> _events = {}; // Map to store events

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:const Text('Event Calendar')),
//       body: Column(
//         children: [
//           TableCalendar(
//             firstDay: DateTime.utc(2021, 1, 1),
//             lastDay: DateTime.utc(2023, 12, 31),
//             focusedDay: _focusedDay,
//             calendarFormat: _calendarFormat,
//             selectedDayPredicate: (day) {
//               return isSameDay(_selectedDay, day);
//             },
//             eventLoader: (day) {
//               return _events[day] ?? [];
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//           ),
//           // Display events for selected date
//           if (_selectedDay.toString().isEmpty && _events.containsKey(_selectedDay))
//           // print('object'),
//             Column(
//               children: _events[_selectedDay]!.map((event) {
//                 return ListTile(
//                   title: const Text('event.title'),
//                   subtitle: Text(event.dateTime.toString()),
//                 );
//               }).toList(),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class Event {
//   final String title;
//   final DateTime dateTime;

//   Event(this.title, this.dateTime);
// }
