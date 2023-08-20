
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimevent/calendar_event_bloc.dart';
import 'package:evaluation_one/interimevent/addeventscreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _selectedDay = DateTime.now();
  // DateTime _focusedDay = DateTime.now();

  // void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  //   Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => AddEventScreen(selectedDay)));
  // }

  // List<Event> _getEventsForDay(DateTime day) {
  //   // Implementation example
  //   // return ['2023-08-09',10:20];
  //   return [
  //     // Event('Event 1', DateTime(2023, 8, 17, 10, 0)),
  //     // Event('Event 2', DateTime(2023, 8, 18, 15, 30)),
  //   ];
  // }

  dateConvertor(dat) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddEventScreen(dat),
        ));
  }
  var displayEvents=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calendar Example')),
        body: Center(
          child: BlocBuilder<EventBloc, List<Event>>(builder: (context, state) {
            displayEvents=state.isEmpty;

            return Column(
              children: [
                SfCalendar(
                  view: CalendarView.month,
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.calendarCell) {
                     
                      dateConvertor(details.date);
                    }
                  },
                  dataSource: _AppointmentDataSource(_getCalendarDataSource()),
                  appointmentBuilder: _appointmentBuilder,
                  // appointmentBuilder: CustomMonthView(events: 2023, 8, 18),
                ),
                
                // if(state.length>0)
                // const SizedBox(
                //   height: 40,
                // ),
                // const Text('Events'),
                //  const SizedBox(
                //   height: 40,
                // ),
                // Card(
                //   elevation: 4.0,
                //   margin: const EdgeInsets.symmetric(
                //       horizontal: 16.0, vertical: 8.0),
                //   child: ListTile(
                //     leading: const Icon(Icons.star),
                //     title:  Text(state.first.eventdate.toString()),
                //     subtitle:  Text(state.first.name,style: const TextStyle(fontWeight:FontWeight.bold),),
                //     trailing:  Text(state.first.time.toString()),
                //     onTap: () {},
                //   ),
                // )
              ],
            );
          }),
        ));
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

  List<Appointment> _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime(2023, 8, 20, 10, 0),
        endTime: DateTime(2023, 8, 20, 11, 0),
        subject: 'Meeting 1',
      ),
      // Add more appointments here
    ];
    return appointments;
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
