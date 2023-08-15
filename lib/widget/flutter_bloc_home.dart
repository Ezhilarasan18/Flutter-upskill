import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';


class BlocHomeScreen extends StatelessWidget {
  const BlocHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  String _inputText = '';
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Example')),
      body: BlocBuilder<ItemBloc, List<Item>>(
        builder: (context, itemList) {
          // print('object${itemList[0]}');
          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              
              // return ListTile(
              //   title: Text(item.id),
              //   trailing: IconButton(
              //     icon: const Icon(Icons.delete),
              //     onPressed: () {
              //       context.read<ItemBloc>().deleteItem(item.id);
              //     },
              //   ),
              // );
               return Card(
            elevation: 4.0,
            margin:const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Text(item.id),
              subtitle: Text('Subtitle for ${item.name}'),
              trailing: const Icon(Icons.delete),
              onTap: () {
              },
            ),
          );


            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Add Product'),
                  content:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        // controller: _textEditingController,
                        scrollPadding: const EdgeInsets.only(top: 20),
                        onChanged: (text) {
                          // setState(() {
                          //   _inputText = text;
                          // });
                          _inputText=text;
                        },
                        
                      ),
                      
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (_inputText.isNotEmpty) {
                          print('inside');
                          
                    // context.read<ItemBloc>().addItem(_inputText);
                  
                          Navigator.of(context).pop();
                        } 
                        
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
