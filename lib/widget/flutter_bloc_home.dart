import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_api_bloc.dart';
import 'package:evaluation_one/flutter_bloc/flutter_theme_bloc.dart';



class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = BlocProvider.of<ItemBloc>(context);
    String inputText = '';
    return Scaffold(
      appBar: AppBar(title: const Text('Students Database')),
      body: BlocConsumer<ItemBloc, ItemState>(
        bloc: itemBloc,
        listener: (context, state) => {
          if (state is ItemLoadingState)
            {
              const Center(
                child: CircularProgressIndicator(),
              )
            }
          else if (state is ItemLoadedState)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Successfully api fetched')),
              )
            }
          else{
            }
        },
        buildWhen: (previous, current) {
       
          if (previous is ItemLoadingState && current is ItemLoadedState) {
            return true;
          } else if (previous is ItemLoadedState &&
              current is ItemLoadedState) {
            return true;
          } else {
            return false;
          }
        },
        listenWhen: (previous, current) {
       
          return true;
        },
        builder: (context, state) {
          if (state is ItemLoadedState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
          } else {
            return const Center(
              child: Text('Waiting for server'),
            );
          }
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
                          inputText = text;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (inputText.isNotEmpty) {
                          itemBloc.addItem(inputText);
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
       bottomNavigationBar: BottomAppBar(
        child: BlocConsumer<ThemeBloc, ThemeData>(
          builder: (context, theme) {
            return IconButton(
              onPressed: () {
                context.read<ThemeBloc>().toggleTheme();
              },
              icon: const Icon(Icons.brightness_4), // Dark theme icon
            );
          },
          listener: (context, theme) {
            // Handle any theme changes
          },
        ),
      ),
    );
  }
}
