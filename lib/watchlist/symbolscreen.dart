import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';

class SymbolScreen extends StatefulWidget {
  final String watchlistName;
  final List<GroupData> existingGroup;
  const SymbolScreen(
      {super.key, required this.watchlistName, required this.existingGroup});

  @override
  State<SymbolScreen> createState() => _SymbolScreenState();
}

class _SymbolScreenState extends State<SymbolScreen> {
  @override
  void initState() {
    final tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    tabBarBloc.add(ApiInitialEvent());
    super.initState();
  }

  late List<Apidata> datafromBloc;
  bool showCreatebutton = false;
  bool sortButtonShow = false;

  void _showSortingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Sorting',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue),
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Text('Clear',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Alphabetically',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Row(
                      children: [
                        Text('A'),
                        Icon(Icons.arrow_downward),
                        Text('Z')
                      ],
                    ),
                    onTap: () {
                      context
                      .read<TabBarBloc>()
                      .add(SortByAtozEvent());
                      Navigator.pop(context);
                    },
                  ),
                  Container(width: 20,),
                  InkWell(
                    child: const Row(
                      children: [
                        Text('Z'),
                        Icon(Icons.arrow_downward),
                        Text('A')
                      ],
                    ),
                    onTap: () {
                      context
                      .read<TabBarBloc>()
                      .add(SortByZtoAEvent());
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'User Id',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Row(
                      children: [
                        Text('0'),
                        Icon(Icons.arrow_downward),
                        Text('9')
                      ],
                    ),
                    onTap: () {
                      context
                      .read<TabBarBloc>()
                      .add(SortBy0to9Event());
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 20,
                  ),
                  InkWell(
                    child: const Row(
                      children: [
                        Text('9'),
                        Icon(Icons.arrow_upward),
                        Text('0')
                      ],
                    ),
                    onTap: () {
                      context
                      .read<TabBarBloc>()
                      .add(SortBy9to0Event());
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<TabBarBloc, TabBarState>(
                listener: (context, state) {
                  setState(() {
                    showCreatebutton = true;
                    sortButtonShow = true;
                  });
                },
                listenWhen: (previous, current) {
                  if (current is ApiLoadedState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is ApiLoadedState) {
                    datafromBloc = state.items;
                    return DefaultTabController(
                      length: 4,
                      child: Scaffold(
                        appBar: AppBar(
                          bottom: const TabBar(tabs: [
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
                  }
                  if (state is ApiInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ApiErrorState) {
                    return Center(child: Text(state.error));
                  }
                  return Container();
                },
              ),
            ),
            Visibility(
              visible: showCreatebutton,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<TabBarBloc>().add(
                        AddselectedsymbolscreateGroupEvent(
                            widget.watchlistName, widget.existingGroup));
                    Navigator.pop(context);
                  },
                  child: const Text('Create Group'),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Visibility(
            visible: sortButtonShow,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: ElevatedButton(
                      onPressed: () {
                        _showSortingBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white),
                      child: const Icon(
                        Icons.sort,
                        color: Colors.blue,
                      ),
                    ),
                  )),
            )));
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
                  context.read<TabBarBloc>().add(ItemSelectEvent(symbol));
                },
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
          ),
        );
      },
    );
  }
}
