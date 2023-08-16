import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:evaluation_one/utils/const.dart';

class ApiService {
  Future<List<Item>> fetchDataFromApi() async {
    final response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Item> items = responseData.map((data) {
        return Item(id: data['id'], name: data['Name'], avatar: data['avatar']);
      }).toList();

      return items;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future deleteItem(dynamic itemId) async {
    print('itemId$itemId');
    
    final response = await http.delete(
      Uri.parse('$apiurl/$itemId'),
    );
    print('11111111${response.body}');
  }

  Future addItem(dynamic inputText) async {
    print('567$inputText');
    final response = await http.post(
      Uri.parse(apiurl),
      body: (<String, dynamic>{
        'Name': inputText,
      }),
    );
    print(response.body);
  }
}

class Item {
  final dynamic id;
  final dynamic name;
  final String avatar;

  Item({required this.id, required this.name, required this.avatar});
}
