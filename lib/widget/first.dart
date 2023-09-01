// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/widget/tab_bloc.dart';
// import 'package:evaluation_one/widget/sec.dart';


// class FirstScreen extends StatelessWidget {
//   final TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('First Screen')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(controller: textController),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SecondScreen()),
//                 );
//               },
//               child: Text('Next'),
//             ),
//             BlocBuilder<TabBloc, TabState>(
//               builder: (context, state) {
//                 return 
//                 // DefaultTabController(
//                 //     length: state.selectedItems.length,
//                 //     child: Column(
//                 //       children: [
//                 //         TabBar(
//                 //           tabs: state.selectedItems
//                 //               .map((item) => Tab(text: item))
//                 //               .toList(),
//                 //         ),
//                 //         TabBarView(
//                 //           children: state.selectedItems
//                 //               .map((item) => Center(child: Text(item)))
//                 //               .toList(),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   );

//                 DefaultTabController(
//               length: state.selectedItems.length,
//               child: Scaffold(
//                 appBar: AppBar(
//                   bottom: TabBar(
//                     // tabs: tabTitles.map((title) => Tab(text: title)).toList(),
//                                  tabs: state.selectedItems
//                               .map((item) => Tab(text: item))
//                               .toList(),
//                   ),
//                 ),
//                 body: TabBarView(
//                   // children: tabTitles.map((title) {
//                   //   return Center(child: Text('Content of $title tab.'));
//                   // }).toList(),
//                   children: state.selectedItems
//                               .map((item) => Center(child: Text(item)))
//                               .toList(),
//                 ),
//               ),
//             );
                
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
