import 'package:flutter/material.dart';
import 'package:evaluation_one/bloc/product_bloc.dart';
import 'dart:math';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _inputText = '';
  final List<String> _dropdownItems = ['Clothes', 'Electronics', 'Vegetables'];
  String _selectedCategory = 'Clothes';
  String generateUniqueId() {
    int randomNumber = Random().nextInt(999999999);
    print(randomNumber);
    return '$randomNumber';
  }

  TextEditingController _textEditingController = TextEditingController();

  void _clearTextField() {
    _textEditingController.clear();
  }

  dynamic prods;
  @override
  void initState() {
    prods = productBloc.productStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: prods,
        initialData: [],
        builder: (context, snapshot) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products?.length,
            itemBuilder: (context, index) {
              final product = products![index];
              return ListTile(
                title: Text(
                  product.category,
                  style: const TextStyle(fontSize: 25, color: Colors.blue),
                ),
                subtitle: Text(
                  product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                leading: Column(
                  children: [
                    if (product.category == _dropdownItems[0])
                      const IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: null,
                      )
                    else if (product.category == _dropdownItems[1])
                      const IconButton(
                        icon: Icon(Icons.movie_creation),
                        onPressed: null,
                      )
                    else if (product.category == _dropdownItems[2])
                      const IconButton(
                        icon: Icon(Icons.home_filled),
                        onPressed: null,
                      )
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    productBloc.deleteProduct(product.id);
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
                        controller: _textEditingController,
                        scrollPadding: const EdgeInsets.only(top: 20),
                        onChanged: (text) {
                          setState(() {
                            _inputText = text;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Enter product item',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      DropdownButton<String>(
                          value: _selectedCategory,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategory = newValue!;
                            });
                          },
                          items: _dropdownItems.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList()),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (_inputText.isNotEmpty) {
                          productBloc.addProduct(Product(generateUniqueId(),
                              _inputText, _selectedCategory));
                          _clearTextField();
                          _inputText = '';
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
          print('abc$title');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
