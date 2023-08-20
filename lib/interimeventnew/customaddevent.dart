import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/utils/string.dart';

class Customaddevent extends StatefulWidget {
  const Customaddevent(this.selectedDate, {super.key});

  final int selectedDate;

  @override
  State<Customaddevent> createState() => _EventScreenState();
}

class _EventScreenState extends State<Customaddevent> {
  final _nameController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

@override
  void initState() {
    print('selecteddate${widget.selectedDate}');
    super.initState();
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(notification),
          content: const Text(enterEvent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(close),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(addEvent)),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: eventName),
          ),
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: const Text(selectTime),
          ),
          Text(
            'Selected Time: ${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isEmpty) {
                _showPopup(context);
              } else {
                final event = Event(_nameController.text,
                    _selectedTime.toString(), widget.selectedDate+1);
                context
                    .read<CustomEventBloc>()
                    .add(ItemAddingEvent(event, widget.selectedDate));
                Navigator.pop(context);
              }
            },
            child: const Text(addEvent),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}
