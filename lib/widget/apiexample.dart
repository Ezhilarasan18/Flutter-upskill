// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ApiCallExample extends StatefulWidget {
//   const ApiCallExample({super.key});

//   @override
//   State<ApiCallExample> createState() => _ApiCallExampleState();
// }

// class _ApiCallExampleState extends State<ApiCallExample> {
//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Call your API function here
//   }

//   Future<void> fetchData() async {
//     final response = await http
//         .get(Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'));
//     if (response.statusCode == 200) {
//       // Successful API call
//     } else {
//       // Handle error
//     }
//   }

//   void post() async {
//     final response = await http.post(
//       Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users'),
//       // headers: <String, String>{
//       //   'Content-Type': 'application/json',
//       // },
//       body: (<String, dynamic>{
//         'id': '4', // Replace with your data
//         'Name': 'Vel',
//       }),
//     );
//   }

//   void delete() async {
//     final response = await http.delete(
//       Uri.parse('https://64da15aee947d30a260abe9f.mockapi.io/users/4'),
//       // headers: <String, String>{
//       //   'Content-Type': 'application/json',
//       // },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('API Call Example'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             TextButton(
//                 onPressed: () {
//                   post();
//                 },
//                 child: const Text('Create')),
//             TextButton(
//                 onPressed: () {
//                   delete();
//                 },
//                 child: const Text('delete'))
//           ],
//         ),
//       ),
//     );
//   }
// }
