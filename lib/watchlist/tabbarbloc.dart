// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
//   List<String> tabTitles = [];

//   TabBarBloc() : super(TabBarInitialState()) {
//     on<AddTabEvent>((event, emit) {
//       tabTitles.add(event.tabTitle);
//       emit(TabBarUpdatedState(List.from(tabTitles)));
//       // emit(TabBarUpdatedState(tabTitles));
//     });

//     // on<ApiInitialEvent>((event, emit) async {
//     //   emit(ApiInitialState());
//     //   final List<Apidata> items = await fetchData();
//     //   print('items$items');
//     //   emit(ApiLoadedState(items));
//     // });
//   }
// }

// // class ApiBloc extends Bloc<TabBarEvent, TabBarState> {
// //   // final  repository;

// //   ApiBloc() : super(ApiInitialState());

// //   // @override
// //   Stream<TabBarState> mapEventToState(TabBarEvent event) async* {
// //     if (event is ApiInitialEvent) {
// //       yield ApiInitialState();
// //       try {
// //         final List<Apidata> data = await fetchData();
// //         yield ApiLoadedState(data);
// //       } catch (e) {
// //         // yield MyErrorState('Error fetching data');
// //       }
// //     }
// //   }
// // }

// Future<List<Apidata>> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse(
//         'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
//     print('Data fetched: ${response.body}');
//     final List<dynamic> responseData = json.decode(response.body);
//     final result = responseData.map((json) => Apidata.fromJson(json)).toList();
//     return result;
//   } catch (e) {
//     return [];
//   }
// }

// abstract class TabBarEvent {}

// class AddTabEvent extends TabBarEvent {
//   final String tabTitle;

//   AddTabEvent(this.tabTitle);
// }

// class ApiInitialEvent extends TabBarEvent {}


// abstract class TabBarState {}

// class TabBarInitialState extends TabBarState {}

// class ApiInitialState extends TabBarState {}

// class ApiLoadedState extends TabBarState {
//   final List<Apidata> items;
//   ApiLoadedState(this.items);
// }

// class ApiErrorState extends TabBarState {
//   final String error;
//   ApiErrorState(this.error);
// }

// class TabBarUpdatedState extends TabBarState {
//   final List<String> tabTitles;

//   TabBarUpdatedState(this.tabTitles);
// }

// class Apidata {
//   final String id;
//   final String name;
//   final String contacts;
//   final String img;

//   Apidata(
//       {required this.id,
//       required this.name,
//       required this.contacts,
//       required this.img});
//   factory Apidata.fromJson(Map<String, dynamic> json) {
//     return Apidata(
//         id: json['id'],
//         name: json['name'],
//         contacts: json['Contacts'],
//         img: json['url']);
//   }
// }
