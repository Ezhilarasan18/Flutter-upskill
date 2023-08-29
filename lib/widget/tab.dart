import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/symbolscreen.dart';

class DynamicTabBarWidget extends StatefulWidget {
  const DynamicTabBarWidget({super.key});
  @override
  State<DynamicTabBarWidget> createState() => _MyTabBarState();
}



// ...

class _MyTabBarState extends State<DynamicTabBarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Apidata> _symbols = [
    Apidata(id: '1', name: 'Name 1', contacts: 'Contacts 1', img: 'image1.jpg', isSelected: true),
    Apidata(id: '2', name: 'Name 2', contacts: 'Contacts 2', img: 'image2.jpg', isSelected: false),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _symbols.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Tab Bar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: _symbols.map<Widget>((symbol) {
            return Tab(
              text: symbol.name,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _symbols.map<Widget>((symbol) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ${symbol.name}"),
                Text("Contacts: ${symbol.contacts}"),
                Text("Image: ${symbol.img}"),
                Text("Selected: ${symbol.isSelected}"),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ...
