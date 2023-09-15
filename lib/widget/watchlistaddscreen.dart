import 'package:flutter/material.dart';
import 'package:evaluation_one/mobx/mobxstore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Watchlistaddscreen extends StatefulWidget{
   const Watchlistaddscreen({super.key,required this.store});
   final DataStore store;

  @override
  State<Watchlistaddscreen> createState() => _WatchlistaddscreenState();
}

class _WatchlistaddscreenState extends State<Watchlistaddscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                if (widget.store.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: widget.store.data.length,
                    itemBuilder: (context, index) {
                      final item = widget.store.data[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('ID: ${item.id}'),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}