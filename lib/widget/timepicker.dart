// import 'package:flutter/material.dart';
// import 'package:flutter_number_picker/flutter_number_picker.dart';

// Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
//   TimeOfDay? selectedTime;

//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Select Time'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Hour Picker
//                 Column(
//                   children: <Widget>[
//                     Text('Hour'),
//                     NumberPicker(
//                       value: selectedTime?.hour ?? TimeOfDay.now().hour,
//                       minValue: 0,
//                       maxValue: 23,
//                       onChanged: (value) {
//                         selectedTime = TimeOfDay(hour: value, minute: selectedTime?.minute ?? 0);
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 20),
//                 // Minute Picker
//                 Column(
//                   children: <Widget>[
//                     Text('Minute'),
//                     NumberPicker(
//                       value: selectedTime?.minute ?? TimeOfDay.now().minute,
//                       minValue: 0,
//                       maxValue: 59,
//                       onChanged: (value) {
//                         selectedTime = TimeOfDay(hour: selectedTime?.hour ?? 0, minute: value);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(selectedTime);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );

//   return selectedTime;
// }
