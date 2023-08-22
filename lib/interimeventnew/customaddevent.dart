import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:flutter/services.dart';
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
  final pickedTime = '';

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
        body: BlocBuilder<CustomEventBloc, CustomState>(
            builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: eventName),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: const Text(selectTime),
              ),
              state is TimeChangeState
                  ? Text(
                      state.selectedTime,
                      style: const TextStyle(fontSize: 20),
                    )
                  : Text(
                      'Selected Time: ${DateTime.now().hour}:${DateTime.now().minute}',
                    ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty) {
                    _showPopup(context);
                  } else {
                    final event = Event(
                        _nameController.text,
                        _selectedTime.toString(),
                        widget.selectedDate + 1,
                        false);
                    context
                        .read<CustomEventBloc>()
                        .add(ItemAddingEvent(event, widget.selectedDate));
                    Navigator.pop(context);
                  }
                },
                child: const Text(addEvent),
              ),
            ],
          );
        }));
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null) {
      _selectedTime = pickedTime;
      context.read<CustomEventBloc>().add(TimeAddingEvent(pickedTime));
    }
  }
}
