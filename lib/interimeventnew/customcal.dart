import 'package:flutter/material.dart';
import 'package:evaluation_one/interimeventnew/customaddevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/interimeventnew/customeventbloc.dart';

class CustomCal extends StatelessWidget {
  CustomCal({super.key});
  // List<int> days = List.generate(30, (index) => index + 1);

  List<List<String>> days = List.generate(30, (index) {
    return [];
  });

// days=List.generate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calendar Example')),
        body: Center(child: BlocBuilder<CustomEventBloc, List<Event>>(
            builder: (context, state) {
              // print('state${state.first.name}');
              // print('time${state.first.time}');
              // print('time${state.first.eventdate}');


         return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // Number of days per row
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              // return DayCard(day: days[index]);
              return Material(
                child: InkWell(
                    onTap: () {
                      // Handle onTap event here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Customaddevent(index),
                          ));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Center(
                            child: Text((index + 1).toString(),),
                          ),
                          // ..._getEventlist(state,index)
                          
                        ],
                      ),
                    )),
              );
            },
          );
        })));
  }

  List<Widget> _getEventlist(List<Event> list,int index){
    if(list[index].name.isNotEmpty){
      List<Widget> eventList=[];

eventList.add(  Text(list[index].name) );
eventList.add(  Text(list[index].time.toString()) );
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
