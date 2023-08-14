import 'package:flutter/material.dart';
import 'package:evaluation_one/provider/productprovider.dart';
import 'package:provider/provider.dart';
import 'package:evaluation_one/utils/const.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final prodProvider = context.watch<ProductProvider>();
    String selectedCategory = 'Clothes';
    return Scaffold(
      appBar: AppBar(title: const Text('Product Manager')),
      body: ListView.builder(
        itemCount: prodProvider.prods.length,
        itemBuilder: (context, index) {
          final prod = prodProvider.prods[index];
          return ListTile(
            title: Text(prod.title),
            subtitle: Text(prod.category),
            // leading: const Icon(Icons.add),
            leading: Column(
                  children: [
                    if (prod.category == cloth)
                      const IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: null,
                      )
                    else if (prod.category == electronics)
                      const IconButton(
                        icon: Icon(Icons.movie_creation),
                        onPressed: null,
                      )
                    else if (prod.category == vegetable)
                      const IconButton(
                        icon: Icon(Icons.home_filled),
                        onPressed: null,
                      )
                  ],
                ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                prodProvider.deleteTask(prod);
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
