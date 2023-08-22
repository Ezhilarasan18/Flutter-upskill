import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/utils/string.dart';

class Customaddevent extends StatefulWidget {
  const Customaddevent(this.selectedDate, this.isTrue, {super.key});

  final int selectedDate;
  final bool isTrue;

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
          return Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: eventName, border: OutlineInputBorder()),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: const Text(selectTime),
                    ),
                  ),
                  state is TimeChangeState
                      ? Text(
                          '$selectedTime${state.selectedTime}',
                          style:
                              const TextStyle(fontSize: 20, color: Colors.pink),
                        )
                      : Text(
                          '$selectedTime${DateTime.now().hour}:${DateTime.now().minute}',
                          style:
                              const TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_nameController.text.isEmpty) {
                      _showPopup(context);
                    } else {
                      final event = Event(
                          _nameController.text,
                          _selectedTime.toString(),
                          widget.selectedDate + 1,
                          widget.isTrue);
                      context
                          .read<CustomEventBloc>()
                          .add(ItemAddingEvent(event, widget.selectedDate));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(addEvent),
                ),
              )
            ],
          ));
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
