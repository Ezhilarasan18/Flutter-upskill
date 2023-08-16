import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';

enum ApiStatus { loading, success, error }
class ItemBloc extends Cubit<List<Item>> {
  final ApiService apiService;

  ItemBloc(this.apiService) : super([]);

  Future fetchItems() async {
    final items = await apiService.fetchDataFromApi();
    print('qwer$items');
    emit(items);
  }

  Future<void> deleteItem(String itemId) async {
    print('abcdef$itemId');
    await apiService.deleteItem(itemId);
    final updatedItems = await apiService.fetchDataFromApi();
    emit(updatedItems);
  }

  Future<void> addItem(String inputText) async {
    print('abcdef$inputText');
    await apiService.addItem(inputText);
    final updatedItems = await apiService.fetchDataFromApi();
    emit(updatedItems);
  }
}


