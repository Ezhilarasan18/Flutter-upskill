import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/flutter_bloc/api_services.dart';

enum ApiStatus { loading, success, error }

class ItemBloc extends Cubit<ItemState>{
  final ApiService apiService;

  ItemBloc(this.apiService) : super(ItemLoadingState());

  Future fetchItems() async {
    try {
      final items = await apiService.fetchDataFromApi();
      emit(ItemLoadedState(items));
    } catch (e) {
      print('qwer');
    }
  }

  Future<void> deleteItem(String itemId) async {
    print('abcdef$itemId');
    try {
      await apiService.deleteItem(itemId);
      final updatedItems = await apiService.fetchDataFromApi();
      emit(ItemLoadedState(updatedItems) );
    } catch (e) {
      print(e);
    }
  }

  Future<void> addItem(String inputText) async {
    print('abcdef$inputText');
    try {
      await apiService.addItem(inputText);
      final updatedItems = await apiService.fetchDataFromApi();
      emit(ItemLoadedState(updatedItems) );
    } catch (e) {
      print(e);
    }
  }
}

abstract class ItemState {}

class ItemLoadingState extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<Item> items;

  ItemLoadedState(this.items);
}

class ItemErrorState extends ItemState {
  final String errorMessage;

  ItemErrorState(this.errorMessage);
}