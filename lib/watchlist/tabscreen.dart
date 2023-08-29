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
  
  //  List<Apidata> duplicateData = [
  //   Apidata(id: '1', name: 'John', contacts: '123456', img: 'image1.jpg',isSelected: true),
  //   Apidata(id: '2', name: 'Jane', contacts: '789012', img: 'image2.jpg',isSelected: false),
  //   Apidata(id: '3', name: 'Alice', contacts: '345678', img: 'image3.jpg',isSelected: false),
  //   Apidata(id: '4', name: 'Bob', contacts: '901234', img: 'image4.jpg',isSelected: true),
  // ];

  @override
  Widget build(BuildContext context) {
    List<List<Apidata>> splitItems = splitList(allItems, 4); // Split the list into 4 sublists

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Symbols'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Contact 1'),
              Tab(text: 'Contact 2'),
              Tab(text: 'Contact 3'),
              Tab(text: 'Contact 4'),
            ],
          ),
        ),
        body: 
        TabBarView(
          children: [
            FirstTabScreen(splitItems[0]),
            SecondTabScreen(splitItems[1]),
            ThirdTabScreen(splitItems[2]),
            FourthTabScreen(splitItems[3]),
          ],
        ),
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
      final temp=list.sublist(start, end < list.length ? end : list.length);
      print('temp${temp.length}');
      return temp;
    },
  );
}

