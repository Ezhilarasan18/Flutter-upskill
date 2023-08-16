import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';

class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {

//   @override
//   void initState() {
// final ItemBloc itemBloc;
//       itemBloc =BlocProvider.of<ItemBloc>(context);

//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = BlocProvider.of<ItemBloc>(context);
    String _inputText = '';
    return Scaffold(
      appBar: AppBar(title: const Text('Students Database')),
      body: BlocBuilder<ItemBloc, List<Item>>(
        builder: (context, itemList) {
          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              return Card(
                elevation: 4.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text(
                    'RollNo:${item.id}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Name: ${item.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  leading: item.avatar.isNotEmpty
                      ? Image.network(
                          item.avatar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/754.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    context.read<ItemBloc>().deleteItem(item.id);
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
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        // controller: _textEditingController,
                        scrollPadding: const EdgeInsets.only(top: 20),
                        onChanged: (text) {
                          _inputText = text;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (_inputText.isNotEmpty) {
                          print('inside');
                          itemBloc.addItem(_inputText);
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
