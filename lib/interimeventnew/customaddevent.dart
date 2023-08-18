import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Customaddevent extends StatefulWidget {
  const Customaddevent(this.selectedDate, {super.key});

  final int selectedDate;

  @override
  State<Customaddevent> createState() => _EventScreenState();
}

class _EventScreenState extends State<Customaddevent> {
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
            decoration: const InputDecoration(labelText: 'Event Name'),
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
              context.read<CustomEventBloc>().addEvent(event);
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
          // widget.selectedDate.year,
          // widget.selectedDate.month,
          // widget.selectedDate.day,
          pickedTime.hour,
          // pickedTime.minute,
        );
          print('_selectedTime$_selectedTime');
      });
    }
  }
}
