// import 'package:flutter/material.dart';
// class Watchlisthome extends StatefulWidget {
//   @override
//   _WatchlisthomeState createState() => _WatchlisthomeState();
// }

// class _WatchlisthomeState extends State<Watchlisthome>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   TextEditingController _textEditingController = TextEditingController();
//   List<String> tabTitles = [];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabTitles.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   void _updateTabs() {
//     setState(() {
//       tabTitles = _textEditingController.text.split(',');
//       _tabController = TabController(length: tabTitles.length, vsync: this);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Tab Bar Example'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration(
//                 labelText: 'Enter tab titles (comma-separated)',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _updateTabs,
//             child: Text('Create Tabs'),
//           ),
//           TabBar(
//             controller: _tabController,
//             tabs: tabTitles.map((title) => Tab(text: title)).toList(),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: tabTitles.map((title) {
//                 return Center(
//                   child: Text('Content for $title'),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }