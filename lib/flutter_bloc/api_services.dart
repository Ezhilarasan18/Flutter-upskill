// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:evaluation_one/utils/const.dart';

// class ApiService {
//   Future<List<MyObject>> fetchDataFromApi() async {
//     final response = await http.get(Uri.parse(apiurl));
//     if (response.statusCode == 200) {
//       // final List<dynamic> responseData = json.decode(response.body);
//       // final List<Item> items = responseData.map((data) {
//       //   return Item(id: data['id'], name: data['Name'], avatar: data['avatar']);

//       // }).toList();
//       // return items;
//       // print('2000000000');

//       // final Map<dynamic, dynamic> responseData = json.decode(response.body);
//       // // var responseData=jsonDecode(response.body);
//       // print('finalresult123$responseData');
//       // // final result = Dataassign.fromJson(responseData);
//       // List<Dataassign> postList = [];
//       // for (int i = 0; i < responseData.length; i++) {
//       //   Dataassign post =
//       //       Dataassign.fromJson(responseData[i] as Map<String, String>);
//       //   postList.add(post);
//       // }

//       final List<dynamic> responseData = json.decode(response.body);
//       final result =
//           responseData.map((json) => MyObject.fromJson(json)).toList();
//       return result;
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   Future deleteItem(dynamic itemId) async {
//     final response = await http.delete(
//       Uri.parse('$apiurl/$itemId'),
//     );
//   }

//   Future addItem(dynamic inputText) async {
//     final response = await http.post(
//       Uri.parse(apiurl),
//       body: (<String, dynamic>{
//         'Name': inputText,
//       }),
//     );
//   }
// }

// class Item {
//   final dynamic id;
//   final dynamic name;
//   final String avatar;

//   Item({required this.id, required this.name, required this.avatar});
// }

// class MyObject {
//   final String id;
//   final String name;
//   final String avatar;

//   MyObject({required this.id, required this.name, required this.avatar});

//   factory MyObject.fromJson(Map<String, dynamic> json) {
//     return MyObject(id: json['id'], name: json['Name'], avatar: json['avatar']);
//   }
// }
