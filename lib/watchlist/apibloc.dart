import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  List<Apidata> items = [];
  ApiBloc() : super(ApiInitialState()) {
    on<ApiInitialEvent>((event, emit) async {
      emit(ApiInitialState());
      final List<Apidata> items = await fetchData();
      print('items$items');
      emit(ApiLoadedState(items));
    });
  }
}

abstract class ApiEvent {}

abstract class ApiState {}

class ApiInitialEvent extends ApiEvent {}

class ApiInitialState extends ApiState {}

class ApiLoadedState extends ApiState {
  final List<Apidata> items;
  ApiLoadedState(this.items);
}

Future<List<Apidata>> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    print('Data fetched: ${response.body}');
    final List<dynamic> responseData = json.decode(response.body);
    final result = responseData.map((json) => Apidata.fromJson(json)).toList();
    return result;
  } catch (e) {
    print('cache');
    return [];
  }
}

class Apidata {
  final String id;
  final String name;
  final String contacts;
  final String img;

  Apidata(
      {required this.id,
      required this.name,
      required this.contacts,
      required this.img});
  factory Apidata.fromJson(Map<String, dynamic> json) {
    return Apidata(
        id: json['id'],
        name: json['name'],
        contacts: json['Contacts'],
        img: json['url']);
  }
}
