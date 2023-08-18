import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:evaluation_one/interimevent/addeventscreen.dart';

class Sfcalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Calendar'),
      ),
      body: SfCalendar(
        view: CalendarView.day,
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.calendarCell) {
            // Navigate to a different screen with the selected date
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEventScreen(DateTime(2023, 8, 18, 10, 0)),
              ),
            );
          }
        },
        dataSource: _AppointmentDataSource(_getCalendarDataSource()),
        // appointmentBuilder: _appointmentBuilder,
        // appointmentBuilder: CustomMonthView(events: 2023, 8, 18),
        // appointmentBuilder: CustomMonthView(monthDate:2023, 8, 18, 10, 0,events: 2023, 8, 18, ),

      ),
    );
  }

  List<Appointment> _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime(2023, 8, 18, 10, 0),
        endTime: DateTime(2023, 8, 18, 11, 0),
        subject: 'Meeting 1',
      ),
      // Add more appointments here
    ];
    return appointments;
  }

  Widget _appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        
      ),
      alignment: Alignment.center,
      child: const Text(
       ' details.appointments[0].subject',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class CustomMonthView extends StatelessWidget {
  final DateTime monthDate;
  final Map<DateTime, List> events; // Replace with your event data structure

  CustomMonthView({required this.monthDate, required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (context, index) {
        final currentDate = DateTime(
          monthDate.year,
          monthDate.month,
          index + 1,
        );

        final eventsForCurrentDate = events[currentDate] ?? [];

        return Column(
          children: [
            Text(currentDate.day.toString()), // Display day number
            SizedBox(height: 4),
            Column(
              children: eventsForCurrentDate.map((event) {
                return Text('event.name'); // Display event name(s)
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

