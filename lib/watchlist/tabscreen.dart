import 'package:evaluation_one/watchlist/tabbarbloc.dart';
// import 'package:evaluation_one/watchlist/apibloc.dart';
import 'package:flutter/material.dart';
import 'package:evaluation_one/watchlist/firsttabscreen.dart';
import 'package:evaluation_one/watchlist/secondtabscreen.dart';
import 'package:evaluation_one/watchlist/thirdtabscreen.dart';
import 'package:evaluation_one/watchlist/fourthtabscreen.dart';

class MyTabScreen extends StatelessWidget {
  final List<Apidata> allItems; // The received list data

  MyTabScreen(this.allItems);

  @override
  Widget build(BuildContext context) {
    List<List<Apidata>> splitItems = splitList(allItems, 4); // Split the list into 4 sublists

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed List Display'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
              Tab(text: 'Tab 4'),
            ],
          ),
        ),
        body: Expanded(
          child: 
        TabBarView(
          children: [
            FirstTabScreen(splitItems[0]),
            SecondTabScreen(splitItems[1]),
            ThirdTabScreen(splitItems[2]),
            FourthTabScreen(splitItems[3]),
          ],
        ),
          )
      ),
    );
  }
}

List<List<T>> splitList<T>(List<T> list, int parts) {
  final int chunkSize = (list.length / parts).ceil();
  return List.generate(
    parts,
    (index) {
      int start = index * chunkSize;
      int end = (index + 1) * chunkSize;
      return list.sublist(start, end < list.length ? end : list.length);
    },
  );
}

