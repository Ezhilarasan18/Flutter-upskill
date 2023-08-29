import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/symbolscreen.dart';

class DynamicTabBarWidget extends StatefulWidget {
  const DynamicTabBarWidget({super.key});
  @override
  State<DynamicTabBarWidget> createState() => _DynamicTabBarWidgetState();
}

class _DynamicTabBarWidgetState extends State<DynamicTabBarWidget> {
  String watchlistName = '';
  bool showErrorDialog = false;

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
  @override
  Widget build(BuildContext context) {
    final tabBarBloc = BlocProvider.of<TabBarBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Tab Bar'),
      ),
      body: BlocConsumer <TabBarBloc, TabBarState>(
        listener: (context, state)  {
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
        // buildWhen: (previous, current)  {
        //   if(current is TabBarErrorState){
        //     return false;
        //   }
        //   return true;
        // },
        builder: (context, state) {
          if (state is AddselectedsymbolscreateGroupInitialstate) {
            return const Center(child: Text('No tabs yet.'));
          }  if (state is AddselectedsymbolscreateGroupSuccessstate) {
            final tabTitles = state.items;
            print('state.items${state.items}');
            return DefaultTabController(
              length: tabTitles.length,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: tabTitles.entries.map((title) => Tab(text: 'title')).toList(),
                  ),
                ),
                // body: TabBarView(
                //   children: [Text(tabTitles[0])]
                // ),
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
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if(watchlistName.isNotEmpty){
                          print('ifffffff');
                        // tabBarBloc.add(AddTabEvent(watchlistName));
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  SymbolScreen(watchlistName: watchlistName,)),
                        );
                        }else{
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