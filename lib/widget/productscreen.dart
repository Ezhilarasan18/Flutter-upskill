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

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return 
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        print('ddf$newValue');
                        _selectedCategory = newValue!;
                      });
                    },
                    items: _dropdownItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList()),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: InkWell(
                    onTap: () {
                      productBloc.addProduct(Product(
                          generateUniqueId(), _inputText, _selectedCategory));

                      _clearTextField();
                    },
                    child: const Text('Add item'),
                  ),
                ),
                
              ],
            ),
          );
        });
      },
    );
  }

  //  dynamic productBloc;
  // @override
  // void initState() {
  // productBloc = productBloc.productStream();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              openBottomSheet(context);
            },
          ),
        ],
      ),
      body:
       StreamBuilder<List<Product>>(
        stream: productBloc.productStream,
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
    );
  }
}
