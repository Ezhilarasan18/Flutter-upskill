import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customaddevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';

class CustomCal extends StatelessWidget {
  CustomCal({super.key});
  // List<int> days = List.generate(30, (index) => index + 1);

  // List<List<String>> days = List.generate(30, (index) {
  //   return [];
  // });

// days=List.generate

  String truncateText(String text) {
    int maxLength = 5;
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }

  final List<String> items = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  @override
  Widget build(BuildContext context) {
    final CustomEventBloc eventBloc = BlocProvider.of<CustomEventBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar Example')),
      body: Center(
        child: BlocConsumer<CustomEventBloc, CustomState>(
          bloc: eventBloc,
          listener: (context, state) => {
            if (state is ItemLoadingState)
              {print('listener ItemLoadingState$state')}
            else if (state is ItemLoadedState)
              {}
          },
          listenWhen: (previous, current) {
            return true;
          },
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            return Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          (eventBloc.listData[index].eventdate
                                              .toString()),
                                        ),
                                         Text(truncateText
                                          (eventBloc.listData[index].name),
                                        ),
                                        //    Text(
                                        //   (eventBloc.listData[index].time),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getEventlist(List<Event> list, int index) {
    print('List<Event>$list');
    if (list[index].name.isNotEmpty) {
      List<Widget> eventList = [];
      eventList.add(Text(list[index].name));
      eventList.add(Text(list[index].time.toString()));
      return eventList;
    }
    return [];
  }
}

// class DayCard extends StatelessWidget {
//   final int day;

//   DayCard({required this.day});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Center(
//         child: Text('$day'),
//       ),
//     );
//   }
// }

// void main() {
//   List<int> days = List.generate(30, (index) => index + 1);

//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('30-Day Calendar')),
//       body: DayCalendar(days: days),
//     ),
//   ));
// }
