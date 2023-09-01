// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/widget/tab_bloc.dart';

// class SecondScreen extends StatelessWidget {
//   final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second Screen')),
//       body: Container( // Wrap with a Container to provide a specific height
//         height: 200, // Set a fixed height
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal, // Enable horizontal scrolling
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return Container(
//               width: 100, // Set the width for each item
//               child: ListTile(
//                 title: Text(items[index]),
//                 onTap: () {
//                   context.read<TabBloc>().add(UpdateTabEvent([items[index]]));
//                   Navigator.pop(context);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

