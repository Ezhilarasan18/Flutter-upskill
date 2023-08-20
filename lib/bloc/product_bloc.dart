// import 'dart:async';

// class Product {
//   final String id;
//   final String title;
//   final String category;
//   Product(this.id, this.title,this.category);
// }

// class ProductBloc {
//   final _productController = StreamController<List<Product>>();
//   Stream<List<Product>> get productStream => _productController.stream;

//  List<Product> _products = [];

//   void addProduct(Product prod) {
//     _products.add(prod);
//     _productController.sink.add(_products);
//   }


//   void deleteProduct(String prodId) {
//     _products.removeWhere((prod) => prod.id == prodId);
//     _productController.sink.add(_products);
//   }

// }

// final productBloc = ProductBloc();
