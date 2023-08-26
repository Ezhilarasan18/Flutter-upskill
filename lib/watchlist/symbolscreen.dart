import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/apibloc.dart';
import 'package:evaluation_one/watchlist/tabscreen.dart';

class SymbolScreen extends StatefulWidget {
  const SymbolScreen({super.key});

  @override
  State<SymbolScreen> createState() => _SymbolScreenState();
}

class _SymbolScreenState extends State<SymbolScreen> {
  @override
  void initState() {
    final apiBloc = BlocProvider.of<ApiBloc>(context);
    apiBloc.add(ApiInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          print('stateeeee$state');
          if (state is ApiLoadedState) {
            return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  // return MyTabScreen(state.items);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: InkWell(
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                            title: Text(state.items[index].name),
                            subtitle: Text(state.items[index].contacts),
                            trailing: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child:
                                  Image.asset('lib/assets/images/person.jpg'),
                            )),
                      ),
                    ),
                  );
                });
          }
          if (state is ApiInitialState) {
            final apiBloc = BlocProvider.of<ApiBloc>(context);
            apiBloc.add(ApiInitialEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
