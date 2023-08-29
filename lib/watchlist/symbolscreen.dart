import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
// import 'package:evaluation_one/watchlist/apibloc.dart';
import 'package:evaluation_one/watchlist/tabscreen.dart';

class SymbolScreen extends StatefulWidget {
  final String watchlistName;
  const SymbolScreen({super.key,required this.watchlistName});

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
                // return MyTabScreen(state.items);
                return ListView.builder(
                    itemCount: tabBarBloc.symbolsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: InkWell(
                          child: Card(
                            elevation: 4,
                            child: CheckboxListTile(
                              title: Text(tabBarBloc.symbolsList[index].name),
                              subtitle: Text(tabBarBloc.symbolsList[index].contacts),
                              value: tabBarBloc.symbolsList[index].isSelected,
                              onChanged: (newValue) {
                                tabBarBloc.add(
                                    ItemSelectEvent(tabBarBloc.symbolsList[index], index));
                              },
                              controlAffinity: ListTileControlAffinity
                                  .trailing, // Checkbox on the left side of the title
                            ),
                            // ListTile(
                            //   title: Text(state.items[index].name),
                            //   subtitle: Text(state.items[index].contacts),
                            //   trailing: ClipRRect(
                            //     borderRadius: BorderRadius.circular(30.0),
                            //     child: Image.asset('lib/assets/images/person.jpg'),
                            //   ),
                            // ),
                          ),
                        ),
                      );
                    });
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
              context.read<TabBarBloc>().add(AddselectedsymbolscreateGroupEvent(widget.watchlistName));
              Navigator.pop(context);
              },
              child: Text('Create Group'),
            ),
          ),
      ],
    ));
  }
}
