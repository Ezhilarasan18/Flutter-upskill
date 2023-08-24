// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/watchlist/tabbarbloc.dart';
// import 'package:evaluation_one/watchlist/symbolscreen.dart';

// class DynamicTabBarWidget extends StatelessWidget {
//   String watchlistName = '';


//   @override
//   Widget build(BuildContext context) {
//     final tabBarBloc = BlocProvider.of<TabBarBloc>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Tab Bar'),
//       ),
//       body: BlocBuilder<TabBarBloc, TabBarState>(
//         builder: (context, state) {
//           if (state is TabBarInitialState) {
//             return const Center(child: Text('No tabs yet.'));
//           } else if (state is TabBarUpdatedState) {
//             final tabTitles = state.tabTitles;
//             return DefaultTabController(
//               length: tabTitles.length,
//               child: Scaffold(
//                 appBar: AppBar(
//                   bottom: TabBar(
//                     tabs: tabTitles.map((title) => Tab(text: title)).toList(),
//                   ),
//                 ),
//                 body: TabBarView(
//                   children: tabTitles.map((title) {
//                     return Center(child: Text('Content of $title tab.'));
//                   }).toList(),
//                 ),
//               ),
//             );
//           }
//           return Container(); // Handle other states if necessary
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // final tabTitle = "New Tab ${tabBarBloc.tabTitles.length + 1}";
//           // tabBarBloc.add(AddTabEvent('abc'));
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Enter watchlist group name'),
//                   content: TextField(
//                     onChanged: (value) => {watchlistName = value},
//                     decoration: const InputDecoration(hintText: 'Enter text'),
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         // Close the dialog
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('Cancel'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // Handle the input value here
//                         tabBarBloc.add(AddTabEvent(watchlistName));
//                         Navigator.of(context).pop();
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SymbolScreen()),
//                         );
//                       },
//                       child:const Text('Submit'),
//                     ),
//                   ],
//                 );
//               });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
