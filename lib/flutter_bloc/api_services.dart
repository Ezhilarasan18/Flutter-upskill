import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Future<List<Item>> fetchItems() async {
  //   // Make API call to fetch items
  // }
  // Future fetchDataFromApi() async {
    Future<List<Item>> fetchDataFromApi() async {
  final response = await http.get(Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'));
  print('123456${response.body}');
  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
     final List<Item> items = responseData.map((data) {
        return Item(
          id: data['id'],
          name: data['Name'],
          // ... other properties
        );
      }).toList();

      return items;
    // return json.decode(response.body);
  // print('responseData${response.body}');
  } else {
    throw Exception('Failed to fetch data');
  }
}

  // Future deleteItem(int itemId) async {
    // Make API call to delete item with itemId
    Future deleteItem(dynamic itemId) async {
      print('itemId$itemId');
    final response = await http.delete(
      Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users/$itemId'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
    );
    print('11111111${response.body}');
  }
  // }

  // Future addItem(dynamic itemId) async {
  //    final response = await http.post(
  //     Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'),
  //     // headers: <String, String>{
  //     //   'Content-Type': 'application/json',
  //     // },
  //     body: (<String, dynamic>{
  //       'id': '123',
  //       'Name': 'onetwothree',
  //     }),
  //   );
  //   print(response.body);
  // }
}

class Item {
  final dynamic id;
  final dynamic name;

  Item({required this.id, required this.name });
}
