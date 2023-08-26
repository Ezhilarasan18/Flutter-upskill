import 'package:flutter/material.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
// import 'package:evaluation_one/watchlist/apibloc.dart';


class FirstTabScreen extends StatelessWidget {


  const FirstTabScreen(this.items,{super.key});
  final List<Apidata> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].name),
          subtitle: Text(items[index].contacts),
        );
      },
    );
  }
}

