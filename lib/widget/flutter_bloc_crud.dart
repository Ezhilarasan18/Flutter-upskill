import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlutterBloccrud extends StatefulWidget {
  const FlutterBloccrud({super.key});

  @override
  State<FlutterBloccrud> createState() => _FlutterBloccrudstate();
}

class _FlutterBloccrudstate extends State<FlutterBloccrud> {
  dynamic users;
  late List stringValues;
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    super.initState();
    // fetchData();
    fetchDataFromApi();// Call your API function here
  }

  Future<void> fetchData() async {
  // Future<List<MyObject>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'));
    print('object${response.statusCode}');
    if (response.statusCode == 200) {
      print('resbody${response.body}');
      
    } else {
      print('API call failed with status code: ${response.statusCode}');
    }
  }

  Future<List> fetchDataFromApi() async {
  final response = await http.get(Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'));
  print('1234${response.body}');

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
  print('responseData${response.body}');

     stringValues = responseData.map((data) {
      return MyObject(id: data['id'].toString(), name: data['name'].toString()); // Replace with the correct key
      print('ggg$data');
    }).toList();
  print('stringvalue$stringValues');
    return stringValues;
  } else {
    throw Exception('Failed to fetch data');
  }
}

  void post() async {
    final response = await http.post(
      Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      body: (<String, dynamic>{
        'id': '4',
        'Name': 'Vel',
      }),
    );
    print(response.body);
  }

  void delete() async {
    final response = await http.delete(
      Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users/4'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
    );
    print(response.body);
  }

final List<MyObject> data=[
  MyObject(id:"1",name:"Ezhil"),
  MyObject(id:"2",name:"Ezhil"),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Example'),
      ),
      body: 
      // Center(
      //   child: Column(
      //     children: [
      //       TextButton(
      //           onPressed: () {
      //             post();
      //           },
      //           child: const Text('Create')),
      //       TextButton(
      //           onPressed: () {
      //             delete();
      //           },
      //           child: const Text('delete'))
      //     ],
      //   ),
      // ),
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin:const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.star),
              title: Text(data[index].id),
              subtitle: Text('Subtitle for ${data[index].name}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
              },
            ),
          );
        },
      ),

      
    );
  }
}

class MyObject {
  final dynamic id;
  final dynamic name;

  MyObject({required this.id, required this.name });
}