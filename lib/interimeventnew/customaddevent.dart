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
  // DateTime _selectedTime = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    print('selectedDate${widget.selectedDate}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // const _selectedTime=DateTime(0001-10-01 00:00:00.000);
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
           Text(
              'Selected Time: ${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 20),
            ),
          ElevatedButton(
            onPressed: () {
              // final event = Event(_nameController.text, _selectedTime);
              // context.read<EventBloc>().addEvent(widget.selectedDate, event);
              //  final event = Event(_nameController.text,_selectedTime.toString(),widget.selectedDate);
              // context.read<CustomEventBloc>().addEvent(event);

                final event = Event(_nameController.text,_selectedTime.toString(),widget.selectedDate);
              context.read<CustomEventBloc>().add(ItemAddingEvent(event,widget.selectedDate));
              Navigator.pop(context);
            },
            child: const Text('Add Event'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final  pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    print('pickedTime$pickedTime');
     if (pickedTime != null) {
    print('inside if');

      setState(() {
        _selectedTime = pickedTime;
      });
    // if (pickedTime != null) {
    //   setState(() {
    //     _selectedTime = DateTime(
    //       // widget.selectedDate.year,
    //       // widget.selectedDate.month,
    //       // widget.selectedDate.day,
    //       pickedTime.hour,
    //       pickedTime.minute,
    //     );
    //      if (pickedTime != null && pickedTime != _selectedTime) {
    //   setState(() {
    //     _selectedTime = pickedTime;
    //   });
    //       print('_selectedTime$_selectedTime');
    //   });
    // }
  }
}}
