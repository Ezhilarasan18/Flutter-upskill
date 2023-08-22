import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customaddevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
import 'package:evaluation_one/utils/string.dart';
import 'package:evaluation_one/utils/const.dart';

class CustomCal extends StatelessWidget {
  const CustomCal({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomEventBloc eventBloc = BlocProvider.of<CustomEventBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(calendarEvent)),
      body: Column(
        children: [
          // Container(
          //   height: 20,
          //   color: Colors.blue,
          //   child: GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 7,
          //     ),
          //     itemCount: items.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: Text(
          //               items[index],
          //               style: const TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
          Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (String cardText in items)
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(cardText),
                    ),
                  ),
                ),
            ],
          ),
        ),
          Flexible(
            child: BlocBuilder<CustomEventBloc, CustomState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 0.5,
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
                                if (eventBloc.listData[index].isTrue == true)
                                  const Icon(
                                    Icons.star,
                                    size: 10,
                                  ),
                                Text(
                                  (eventBloc.listData[index].eventdate
                                      .toString()),
                                ),
                                Text(
                                  eventBloc.listData[index].name,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                if (eventBloc.listData[index].time.isNotEmpty)
                                  Text(
                                    timeConvert(eventBloc.listData[index].time),
                                    style: const TextStyle(color: Colors.blue),
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
