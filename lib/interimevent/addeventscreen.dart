import 'package:flutter/material.dart';
import 'package:evaluation_one/interimevent/calendar_event_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventScreen extends StatefulWidget {

 const AddEventScreen(this.selectedDate,{super.key});
 
  final DateTime selectedDate;
  @override
  State <AddEventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<AddEventScreen> {
  final _nameController = TextEditingController();
  DateTime _selectedTime = DateTime.now();

  @override
  void initState() {
  
print('selectedDate${widget.selectedDate}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration:const InputDecoration(labelText: 'Event Name'),
          ),
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: const Text('Select Time'),
          ),
          ElevatedButton(
            onPressed: () {
              // final event = Event(_nameController.text, _selectedTime);
              // context.read<EventBloc>().addEvent(widget.selectedDate, event);
               final event = Event(_nameController.text, _selectedTime,widget.selectedDate);
              context.read<EventBloc>().addEvent(event);
              Navigator.pop(context);
            },
            child: const Text('Add Event'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = DateTime(
          widget.selectedDate.year,
          widget.selectedDate.month,
          widget.selectedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }
}
