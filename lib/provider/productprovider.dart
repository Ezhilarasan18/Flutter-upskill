import 'package:flutter/foundation.dart';
class Product {
  final String id;
  final String title;
  final bool isCompleted;
  final String category;

  Product({required this.id, required this.title, this.isCompleted = false,required this.category});
}

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', title: 'Buy groceries',category: 'Electronics'),
    Product(id: '2', title: 'Go to the gym',category:'Electronics' ),
  ];

  List<Product> get prods => _products;

  void addTask(Product prod) {
    _products.add(prod);
    notifyListeners();
  }

  void deleteTask(Product prod) {
    _products.remove(prod);
    notifyListeners();
  }
}
