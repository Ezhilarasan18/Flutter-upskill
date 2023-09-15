import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'mobxstore.g.dart';


class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  final ApiService apiService = ApiService(); // Replace with your API service class

  @observable
  ObservableList<DataModel> data = ObservableList<DataModel>();
  
  @observable
  final textValue=Observable('');

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchData() async {
    isLoading = true;
    final result = await apiService.fetchData(); // Replace with your API call
    data.clear();
    data.addAll(result);
    isLoading = false;
  }
  @action
  void setTextvalue(String text) async {
    textValue.value=text;
  }
}

class ApiService {
  Future<List<DataModel>> fetchData() async {
    final response = await http.get(Uri.parse('http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => DataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class DataModel {
  final String id;
  final String name;

  DataModel({
    required this.id,
    required this.name,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
