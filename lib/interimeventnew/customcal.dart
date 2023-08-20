import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customaddevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:evaluation_one/utils/string.dart';

class CustomCal extends StatelessWidget {
  CustomCal({super.key});

  String truncateText(String text) {
    int maxLength = 5;
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  timeConvert(dynamic text) {
    if (text.isNotEmpty) {
      String timeString = text.toString();
      String extractedValue = timeString.split('(')[1].split(')')[0];
      return extractedValue;
    }
  }

  
  final List<String> items=['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  @override
  Widget build(BuildContext context) {
    final CustomEventBloc eventBloc = BlocProvider.of<CustomEventBloc>(context);
    return Scaffold(
        appBar: AppBar(title: const Text(calendarEvent)),
        body: 
        Column(
          children: [
            Expanded(
              child: 
              Container(
                color: Colors.red,
                child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          items[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
              )
            ),  
            Flexible(
              child: BlocConsumer<CustomEventBloc, CustomState>(
                bloc: eventBloc,
                listener: (context, state) => {                  
                },
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    itemCount: eventBloc.listData.length,
                    itemBuilder: (context, index) {
                      return Material(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Customaddevent(index),
                                  ));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                            Text(
                                              (eventBloc
                                                  .listData[index].eventdate
                                                  .toString()),
                                            ),
                                            Text(
                                              truncateText(eventBloc
                                                  .listData[index].name),
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                            if (eventBloc.listData[index].time
                                                .isNotEmpty)
                                              Text(
                                                timeConvert(eventBloc
                                                    .listData[index].time),
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              )
                                ],
                              ),
                            )),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
        );
  }

}


