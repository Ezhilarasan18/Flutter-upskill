import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  List<Apidata> symbolsList = [];
  TabBarBloc() : super(TabBarInitialState()) {
    List<Apidata> _selectedsymbols = [];
    List<GroupData> groupDataList = [];
    List<Apidata> sortAtoZ = [];
    on<ApiInitialEvent>((event, emit) async {
      emit(ApiInitialState());
      final List<Apidata> items = await fetchData();
      symbolsList = items;
      emit(ApiLoadedState(items));
      if (items.isEmpty) {
        emit(ApiErrorState('something went wrong'));
      }
    });
    on<SortByAtozEvent>((event, emit) async {
      final sortAtoZ = List.of(symbolsList);
      sortAtoZ.sort((a, b) => a.name.compareTo(b.name));
      symbolsList = sortAtoZ;
      emit(ApiLoadedState(symbolsList));
    });

    on<SortByZtoAEvent>((event, emit) async {
      final sortAtoZ = List.of(symbolsList);
      sortAtoZ.sort((a, b) => b.name.compareTo(a.name));
      symbolsList = sortAtoZ;
      emit(ApiLoadedState(symbolsList));
    });

    on<SortBy0to9Event>((event, emit) async {
      sortAtoZ = List.of(symbolsList);
      sortAtoZ.sort((a, b) => b.contacts.compareTo(a.contacts));
      symbolsList = sortAtoZ;
      emit(ApiLoadedState(sortAtoZ));
    });

    on<SortBy9to0Event>((event, emit) async {
      sortAtoZ = List.of(symbolsList);
      sortAtoZ.sort((a, b) => a.contacts.compareTo(b.contacts));
      symbolsList = sortAtoZ;
      emit(ApiLoadedState(sortAtoZ));
    });

    on<ItemSelectEvent>((event, emit) async {
      List<Apidata> updatedSymbol = symbolsList;
      final index =
          updatedSymbol.indexWhere((element) => element.id == event.items.id);
      updatedSymbol[index] = Apidata(
          id: event.items.id,
          name: event.items.name,
          contacts: event.items.contacts,
          img: event.items.img,
          isSelected: !event.items.isSelected);
      emit(ApiLoadedState(updatedSymbol));
      List<Apidata> selectedItems =
          updatedSymbol.where((item) => item.isSelected).toList();
      _selectedsymbols = selectedItems;
    });

    on<AddselectedsymbolscreateGroupEvent>((event, emit) async {
      if (event.existingGroup.isEmpty && _selectedsymbols.isNotEmpty) {
        groupDataList.add(
            GroupData(groupName: event.groupname, symbols: _selectedsymbols));
        _selectedsymbols = [];
        emit(AddselectedsymbolscreateGroupSuccessstate(groupDataList));
      } else if (event.existingGroup.isNotEmpty &&
          _selectedsymbols.isNotEmpty) {
        List<GroupData> groupDataList = event.existingGroup;
        groupDataList.add(
            GroupData(groupName: event.groupname, symbols: _selectedsymbols));
        _selectedsymbols = [];
        emit(AddselectedsymbolscreateGroupSuccessstate(groupDataList));
      } else if (event.existingGroup.isNotEmpty && _selectedsymbols.isEmpty) {
        emit(AddselectedsymbolscreateGroupSuccessstate(event.existingGroup));
      }
    });
  }
}

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

abstract class TabBarEvent {}

class ApiInitialEvent extends TabBarEvent {}

abstract class TabBarState {}

class TabBarInitialState extends TabBarState {}

class ApiInitialState extends TabBarState {}

class ApiLoadedState extends TabBarState {
  final List<Apidata> items;
  ApiLoadedState(this.items);
}

class ApiErrorState extends TabBarState {
  final String error;
  ApiErrorState(this.error);
}

class ItemSelectEvent extends TabBarEvent {
  final Apidata items;

  ItemSelectEvent(this.items);
}

class AddselectedsymbolscreateGroupEvent extends TabBarEvent {
  final String groupname;
  final List<GroupData> existingGroup;

  AddselectedsymbolscreateGroupEvent(this.groupname, this.existingGroup);
}

class SortByAtozEvent extends TabBarEvent {}

class SortByZtoAEvent extends TabBarEvent {}
class SortBy0to9Event extends TabBarEvent {}

class SortBy9to0Event extends TabBarEvent {}


class AddselectedsymbolscreateGroupSuccessstate extends TabBarState {
  final List<GroupData> items;

  AddselectedsymbolscreateGroupSuccessstate(this.items);
}

class AddselectedsymbolscreateGroupInitialstate extends TabBarState {}

class TabBarErrorState extends TabBarState {
  final String error;

  TabBarErrorState(this.error);
}

class GroupData {
  final String groupName;
  final List<Apidata> symbols;

  GroupData({required this.groupName, required this.symbols});
}

class Apidata {
  final String id;
  final String name;
  final String contacts;
  final String img;
  late final bool isSelected;

  Apidata(
      {required this.id,
      required this.name,
      required this.contacts,
      required this.img,
      required this.isSelected});
  factory Apidata.fromJson(Map<String, dynamic> json) {
    return Apidata(
        id: json['id'],
        name: json['name'],
        contacts: json['Contacts'],
        img: json['url'],
        isSelected: json['isSelected']);
  }
}
