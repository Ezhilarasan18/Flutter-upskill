import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  List<String> tabTitles = [];

  List<Apidata> symbolsList = [];
  TabBarBloc() : super(TabBarInitialState()) {
    List<Apidata> _selectedsymbols = [];
          List<GroupData> groupDataList = [];

    // on<AddTabEvent>((event, emit) {
    //   bool nameExists = tabTitles.any((item) => item == event.tabTitle);
    //   print('nameExists$nameExists');
    //   if (nameExists) {
    //     print('inside if');
    //     emit(TabBarErrorState('error'));
    //   }
    //   // print('outside if');

    //   else {
    //     print('inside else');
    //     tabTitles.add(event.tabTitle);
    //     emit(TabBarUpdatedState(List.from(tabTitles)));
    //     // emit(TabBarUpdatedState(tabTitles));
    //   }
    // });

    on<ApiInitialEvent>((event, emit) async {
      emit(ApiInitialState());
      final List<Apidata> items = await fetchData();
      print('items$items');
      symbolsList = items;
      emit(ApiLoadedState(items));
      if(items.isEmpty){
        emit(ApiErrorState('something went wrong'));
      }
    });

    on<ItemSelectEvent>((event, emit) async {
      print('event.items${event.items}');
      final updatedSymbol = symbolsList;
      updatedSymbol[event.index] = Apidata(
          id: event.items.id,
          name: event.items.name,
          contacts: event.items.contacts,
          img: event.items.img,
          isSelected: !event.items.isSelected);
      emit(ApiLoadedState(updatedSymbol));
      List<Apidata> selectedItems =
          updatedSymbol.where((item) => item.isSelected).toList();
      _selectedsymbols = selectedItems;
      print('_selectedsymbols$_selectedsymbols');
    });

    on<AddselectedsymbolscreateGroupEvent>((event, emit) async {
      print('evemt${event.groupname}');
      // Map<String, dynamic> groupData = {
      //   'groupname': event.groupname,
      //   'symbols': _selectedsymbols
      // };
      // print('groupData$groupData');
//       List<GroupData> groupDataList = [
//   GroupData(
//     groupName: 'Group A',
//     symbols: [
//       Apidata(id: '1', name: 'Location 1', contacts: '123456', img: 'img1.jpg', isSelected: false),
//       Apidata(id: '2', name: 'Location 2', contacts: '789012', img: 'img2.jpg', isSelected: false),
//     ],
//   ),
//   GroupData(
//     groupName: 'Group B',
//     symbols: [
//       Apidata(id: '3', name: 'Location 3', contacts: '345678', img: 'img3.jpg', isSelected: false),
//       Apidata(id: '4', name: 'Location 4', contacts: '901234', img: 'img4.jpg', isSelected: false),
//     ],
//   ),
//   // Add more groups as needed
// ];
      // if (_selectedsymbols.isNotEmpty) {
      //   print('1');
        if (event.existingGroup.isEmpty&& _selectedsymbols.isNotEmpty) {
        print('1');
          groupDataList.add(
              GroupData(groupName: event.groupname, symbols: _selectedsymbols));
          _selectedsymbols=[];
          emit(AddselectedsymbolscreateGroupSuccessstate(groupDataList));
        } else if(event.existingGroup.isNotEmpty&& _selectedsymbols.isNotEmpty) {
        print('2');
          List<GroupData> groupDataList = event.existingGroup;
          groupDataList.add(
              GroupData(groupName: event.groupname, symbols: _selectedsymbols));
          _selectedsymbols=[];
          emit(AddselectedsymbolscreateGroupSuccessstate(groupDataList));

        }else if(event.existingGroup.isNotEmpty&&_selectedsymbols.isEmpty){
          emit(AddselectedsymbolscreateGroupSuccessstate(event.existingGroup));
        }
        // emit(AddselectedsymbolscreateGroupSuccessstate(event.existingGroup));

      // }
        // print('4');
        // _selectedsymbols = [];
        //   emit(AddselectedsymbolscreateGroupSuccessstate(event.existingGroup));
    });
  }
}

Future<List<Apidata>> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    print('Data fetched: ${response.body}');
    List<Map<String, dynamic>> parsedResponse =
        jsonDecode(response.body).cast<Map<String, dynamic>>();
    for (var item in parsedResponse) {
      item['isSelected'] = false;
    }
    print('parsedResponse$parsedResponse');
    final result =
        parsedResponse.map((json) => Apidata.fromJson(json)).toList();
    return result;
  } catch (e) {
    return [];
  }
}

abstract class TabBarEvent {}

class AddTabEvent extends TabBarEvent {
  final String tabTitle;

  AddTabEvent(this.tabTitle);
}

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
  final int index;
  ItemSelectEvent(this.items, this.index);
}

class AddselectedsymbolscreateGroupEvent extends TabBarEvent {
  final String groupname;
  final List<GroupData> existingGroup;
  AddselectedsymbolscreateGroupEvent(this.groupname, this.existingGroup);
}

class AddselectedsymbolscreateGroupSuccessstate extends TabBarState {
  final List<GroupData> items;
  AddselectedsymbolscreateGroupSuccessstate(this.items);

  //  final Map<String,dynamic> items;
  // AddselectedsymbolscreateGroupSuccessstate(this.items);
}

class AddselectedsymbolscreateGroupInitialstate extends TabBarState {}

class TabBarUpdatedState extends TabBarState {
  final List<String> tabTitles;

  TabBarUpdatedState(this.tabTitles);
}

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

class WatchlistNameAddEvent extends TabBarEvent {
  final String watchlistName;
  WatchlistNameAddEvent(this.watchlistName);
}

class WatchlistNameAddedState extends TabBarState {
  final String watchlistName;
  WatchlistNameAddedState(this.watchlistName);
}
