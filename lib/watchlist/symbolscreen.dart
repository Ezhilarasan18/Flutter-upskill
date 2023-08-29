import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
// import 'package:evaluation_one/watchlist/apibloc.dart';
import 'package:evaluation_one/watchlist/tabscreen.dart';

class SymbolScreen extends StatefulWidget {
  final String watchlistName;
  const SymbolScreen({super.key, required this.watchlistName});

  @override
  State<SymbolScreen> createState() => _SymbolScreenState();
}

class _SymbolScreenState extends State<SymbolScreen> {
  @override
  void initState() {
    final tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    tabBarBloc.add(ApiInitialEvent());
    print('widget.watchlistName${widget.watchlistName}');
    super.initState();
  }

  late List<Apidata> datafromBloc;

  @override
  Widget build(BuildContext context) {
    final tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: BlocBuilder<TabBarBloc, TabBarState>(
            builder: (context, state) {
              if (state is ApiLoadedState) {
                datafromBloc = state.items;
                return DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: TabBar(tabs: [
                        Tab(text: 'Contact 1'),
                        Tab(text: 'Contact 2'),
                        Tab(text: 'Contact 3'),
                        Tab(text: 'Contact 4')
                      ]),
                    ),
                    body: TabBarView(
                      children: [
                        buildTabContent(0),
                        buildTabContent(1),
                        buildTabContent(2),
                        buildTabContent(3),
                      ],
                    ),
                  ),
                );

                // return MyTabScreen(state.items);
                // return ListView.builder(
                //   itemCount: tabBarBloc.symbolsList.length,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 8.0, horizontal: 16.0),
                //       child: InkWell(
                //         child: Card(
                //           elevation: 4,
                //           child: CheckboxListTile(
                //             title: Text(tabBarBloc.symbolsList[index].name),
                //             subtitle:
                //                 Text(tabBarBloc.symbolsList[index].contacts),
                //             value: tabBarBloc.symbolsList[index].isSelected,
                //             onChanged: (newValue) {
                //               tabBarBloc.add(ItemSelectEvent(
                //                   tabBarBloc.symbolsList[index], index));
                //             },
                //             controlAffinity: ListTileControlAffinity
                //                 .trailing, // Checkbox on the left side of the title
                //           ),
                //           // ListTile(
                //           //   title: Text(state.items[index].name),
                //           //   subtitle: Text(state.items[index].contacts),
                //           //   trailing: ClipRRect(
                //           //     borderRadius: BorderRadius.circular(30.0),
                //           //     child: Image.asset('lib/assets/images/person.jpg'),
                //           //   ),
                //           // ),
                //         ),
                //       ),
                //     );
                //   },
                // );
              }
              if (state is ApiInitialState) {
                final apiBloc = BlocProvider.of<TabBarBloc>(context);
                apiBloc.add(ApiInitialEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              context.read<TabBarBloc>().add(
                  AddselectedsymbolscreateGroupEvent(widget.watchlistName));
              Navigator.pop(context);
            },
            child: Text('Create Group'),
          ),
        ),
      ],
    ));
  }

  Widget buildTabContent(int tabIndex) {
    final tabData = datafromBloc.sublist(tabIndex * (datafromBloc.length ~/ 4),
        (tabIndex + 1) * (datafromBloc.length ~/ 4));
    return ListView.builder(
      itemCount: tabData.length,
      itemBuilder: (context, index) {
        Apidata symbol = tabData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: InkWell(
            child: Card(
              elevation: 4,
              child: CheckboxListTile(
                title: Text(symbol.name),
                subtitle: Text(symbol.contacts),
                value: symbol.isSelected,
                onChanged: (newValue) {
                  context
                      .read<TabBarBloc>()
                      .add(ItemSelectEvent(symbol,  int.parse(symbol.id)-1));
                },
                controlAffinity: ListTileControlAffinity
                    .trailing, 
              ),
            ),
          ),
        );
      },
    );
  }
}
