import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';

Future<List<Apidata>> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    List<Map<String, dynamic>> parsedResponse =
        jsonDecode(response.body).cast<Map<String, dynamic>>();
    for (var item in parsedResponse) {
      item['isSelected'] = false;
    }
    final result =
        parsedResponse.map((json) => Apidata.fromJson(json)).toList();
    return result;
  } catch (e) {
    return [];
  }
}