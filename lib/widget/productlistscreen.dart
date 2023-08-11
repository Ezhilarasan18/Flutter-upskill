import 'package:flutter/material.dart';
import 'package:evaluation_one/provider/productprovider.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final prodProvider = context.watch<ProductProvider>();
    String selectedCategory = 'Clothes';
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: ListView.builder(
        itemCount: prodProvider.prods.length,
        itemBuilder: (context, index) {
          final task = prodProvider.prods[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.category),
            leading: const Icon(Icons.add),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                prodProvider.deleteTask(task);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await showDialog(
            context: context,
            builder: (BuildContext context) {
              String productTitle = '';
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Add Product'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          productTitle = value;
                        },
                      ),
                      DropdownButton<String>(
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: <String>['Clothes', 'Electronics', 'Vegetables']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(productTitle);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
            },
          );

          if (title != null) {
            prodProvider.addTask(Product(
                id: DateTime.now().toString(),
                title: title,
                category: selectedCategory));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
