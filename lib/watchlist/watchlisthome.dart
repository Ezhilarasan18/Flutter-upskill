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
  List<GroupData> existingGroup = [];

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          if (state is TabBarInitialState) {
            return const Center(child: Text('No watchlis created'));
          }
          if (state is AddselectedsymbolscreateGroupSuccessstate) {
            final tabTitles = state.items;
            existingGroup = state.items;
            print('existingGroup$existingGroup');
            return DefaultTabController(
              length: tabTitles.length,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: state.items
                        .map((group) => Tab(text: group.groupName))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  children: state.items
                      .map((group) => SymbolList(symbols: group.symbols))
                      .toList(),
                ),
              ),
            );
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
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (watchlistName.isNotEmpty) {
                          if (existingGroup.isNotEmpty) {
                            for (var groupData in existingGroup) {
                              if (groupData.groupName == watchlistName) {
                                _showErrorDialog(context, 'Name already exist');
                              } else {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SymbolScreen(
                                        watchlistName: watchlistName,
                                        existingGroup: existingGroup),
                                  ),
                                );
                              }
                            }
                          } else {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymbolScreen(
                                    watchlistName: watchlistName,
                                    existingGroup: existingGroup),
                              ),
                            );
                          }
                        } else {
                          _showErrorDialog(context, "Enter a group name");
                        }
                      },
                      child: const Text('Next'),
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
            Navigator.pop(context);
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
