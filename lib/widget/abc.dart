import 'package:flutter/material.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';

class Abc extends StatelessWidget{
   Abc({super.key});
List<GroupData> groupDataList = [
  GroupData(
    groupName: 'Group A',
    symbols: [
      Apidata(id: '1', name: 'Location 1', contacts: '123456', img: 'img1.jpg', isSelected: false),
      Apidata(id: '2', name: 'Location 2', contacts: '789012', img: 'img2.jpg', isSelected: false),
    ],
  ),
  GroupData(
    groupName: 'Group B',
    symbols: [
      Apidata(id: '3', name: 'Location 3', contacts: '345678', img: 'img3.jpg', isSelected: false),
      Apidata(id: '4', name: 'Location 4', contacts: '901234', img: 'img4.jpg', isSelected: false),
    ],
  ),
  // Add more groups as needed
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: ListView.builder(
  itemCount: groupDataList.length,
  itemBuilder: (context, groupIndex) {
    return Card(
      child: Column(
        children: [
          Text(groupDataList[groupIndex].groupName, style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: groupDataList[groupIndex].symbols.length,
            itemBuilder: (context, symbolIndex) {
              Apidata symbol = groupDataList[groupIndex].symbols[symbolIndex];
              return ListTile(
                title: Text(symbol.name),
                subtitle: Text(symbol.contacts),
                // leading: Image.asset(symbol.img),
                // Other ListTile properties...
              );
            },
          ),
        ],
      ),
    );
  },
)
,
    );
  }
}

class GroupData {
  final String groupName;
  final List<Apidata> symbols;

  GroupData({required this.groupName, required this.symbols});
}