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
      // remove the return
      return e;
    }
  }

  Future<void> deleteItem(String itemId) async {
    try {
      await apiService.deleteItem(itemId);
      final updatedItems = await apiService.fetchDataFromApi();
      emit(ItemLoadedState(updatedItems) );
    } catch (e) {
      // remove the return

      // return e;
    }
  }

  Future<void> addItem(String inputText) async {
    try {
      await apiService.addItem(inputText);
      final updatedItems = await apiService.fetchDataFromApi();
      emit(ItemLoadedState(updatedItems) );
    } catch (e) {
      // print(e);
      // return e;
    }
  }
}

abstract class ItemState {}

class ItemLoadingState extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<MyObject> items;

  ItemLoadedState(this.items);
}

class ItemErrorState extends ItemState {
  final String errorMessage;

  ItemErrorState(this.errorMessage);
}