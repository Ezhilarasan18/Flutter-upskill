import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/symbolscreen.dart';

class DynamicTabBarWidget extends StatefulWidget {
  const DynamicTabBarWidget({super.key});
  @override
  State<DynamicTabBarWidget> createState() => _DynamicTabBarWidgetState();
}

class _DynamicTabBarWidgetState extends State<DynamicTabBarWidget>
    with SingleTickerProviderStateMixin {
  String watchlistName = '';
  bool showErrorDialog = false;
   List<GroupData> existingGroup=[];

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  late TabBarBloc tabBarBloc;
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    final tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    final List<String> tabTitles = [];
    for (var key in tabBarBloc.tabTitles) {
      tabTitles.add(key);
    }
    tabController = TabController(length: tabTitles.length, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Tab Bar'),
      ),
      body: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {
          //  showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: Text('Error'),
          //             content: Text('error'),
          //             actions: [
          //               TextButton(
          //                 onPressed: () async {
          //                   Navigator.pop(context);
          //                 },
          //                 child: Text('OK'),
          //               ),
          //             ],
          //           );
          //         },
          //       );
        },
        // listenWhen: (previous, current)  {
        //   if(previous is TabBarUpdatedState && current is TabBarErrorState){
        //     return true;
        //   }
        //   return false;
        // },
        buildWhen: (previous, current)  {
          // if(previous is AddselectedsymbolscreateGroupSuccessstate|| current is AddselectedsymbolscreateGroupSuccessstate){
            return true;
          // }
          // return false;
        },
        builder: (context, state) {
          if (state is AddselectedsymbolscreateGroupInitialstate) {
            return const Center(child: Text('No tabs yet.'));
          }
          if (state is AddselectedsymbolscreateGroupSuccessstate) {
            final tabTitles = state.items;
            existingGroup=state.items;
            print('state.items${state.items}');
            return DefaultTabController(
                length: tabTitles.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: state.items
                          .map((group) => Tab(text: group.groupName))
                          .toList(),
                    ),

                    // TabBar(tabs: [Tab(text: state.items['groupname'])])
                    // bottom: TabBar(
                    //   tabs: tabTitles.entries.map((title) => Tab(text: title.value)).toList(),
                    // ),
                    //          bottom: TabBar(
                    //           controller: tabController,
                    //           // tabs: tabTitles[0],
                    //                     tabs: state.items[0]['symbols'].map<Widget>((symbol) {
                    //   Tab(
                    //     text: state.items[0]['groupname'], // Use the groupname as tab title
                    //   );
                    // }).toList(),
                    // //         ),
                    //       ),

                    // body: TabBarView(
                    //   children: [Text(tabTitles[0])]
                    // ),

                    //                 body: TabBarView(controller: tabController, children: [
                    //   ...generateTabView(tabTitles[tabController.index])
                    // ]),
                  ),
                  // body: TabBarView(
                  //   children: [
                  //     ListView.builder(
                  //       itemCount: state.items['symbols'].length,
                  //       itemBuilder: (context, index) {
                  //         Apidata symbol =
                  //             state.items['symbols'][index] as Apidata;
                  //         return ListTile(
                  //           title: Text(symbol.name),
                  //           subtitle: Text(symbol.contacts),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  body: TabBarView(
                    children: state.items
                        .map((group) => SymbolList(symbols: group.symbols))
                        .toList(),
                  ),
                ));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Enter watchlist group name'),
                  content: TextField(
                    onChanged: (value) => {watchlistName = value},
                    decoration: const InputDecoration(
                      hintText: 'Enter text',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (watchlistName.isNotEmpty) {
                          print('ifffffff');
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SymbolScreen(
                                      watchlistName: watchlistName,
                                      existingGroup:existingGroup
                                    )),
                          );
                        } else {
                          print('elseeeee');
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> generateTabView(String title) {
    return [];
  }
}

class SymbolList extends StatelessWidget {
  final List<Apidata> symbols;
  SymbolList({required this.symbols});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: symbols.length,
      itemBuilder: (context, index) {
        final symbol = symbols[index];
        return ListTile(
          title: Text(symbol.name),
          subtitle: Text(symbol.contacts),
        );
      },
    );
  }
}

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Failure: $error'),
        ElevatedButton(
          onPressed: () {
            // Retry or navigate to another screen, etc.
            Navigator.pop(context);
          },
          child: Text('Retry'),
        ),
      ],
    );
  }
}
