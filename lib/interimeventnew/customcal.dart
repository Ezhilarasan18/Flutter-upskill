// import 'package:flutter/material.dart';
// import 'package:evaluation_one/interimeventnew/customaddevent.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/interimeventnew/customeventbloc.dart';
// import 'package:evaluation_one/utils/string.dart';
// import 'package:evaluation_one/utils/const.dart';

// class CustomCal extends StatelessWidget {
//   const CustomCal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CustomEventBloc eventBloc = BlocProvider.of<CustomEventBloc>(context);
//     return Scaffold(
//       appBar: AppBar(title: const Text(calendarEvent)),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(1.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 for (String cardText in items)
//                   Padding(
//                     padding: const EdgeInsets.only(right: 5.0),
//                     child: Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Text(cardText),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           Flexible(
//             child: BlocBuilder<CustomEventBloc, CustomState>(
//               builder: (context, state) {
//                 return GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 7,
//                     childAspectRatio: 0.5,
//                   ),
//                   itemCount: eventBloc.listData.length,
//                   itemBuilder: (context, index) {
//                     return Material(
//                       child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Customaddevent(
//                                       index, eventBloc.listData[index].isTrue),
//                                 ));
//                           },
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Row(
//                                     children: [
//                                       if (eventBloc.listData[index].isTrue ==
//                                           true)
//                                         Container(
//                                             width: 20,
//                                             height: 20,
//                                             decoration: const BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.blue,
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 (eventBloc
//                                                     .listData[index].eventdate
//                                                     .toString()),
//                                                 style: const TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             )),
//                                       if (eventBloc.listData[index].isTrue ==
//                                           false)
//                                         Text(
//                                           (eventBloc.listData[index].eventdate
//                                               .toString()),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                     child: SingleChildScrollView(
//                                   child: Text(
//                                     eventBloc.listData[index].name,
//                                     style: const TextStyle(color: Colors.blue),
//                                   ),
//                                 )),
//                                 if (eventBloc.listData[index].time.isNotEmpty)
//                                   Text(
//                                     timeConvert(eventBloc.listData[index].time),
//                                     style: const TextStyle(color: Colors.blue),
//                                   )
//                               ],
//                             ),
//                           )),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
