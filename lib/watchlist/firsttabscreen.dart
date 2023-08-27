import 'package:flutter/material.dart';
// import 'package:evaluation_one/watchlist/tabbarbloc.dart';
import 'package:evaluation_one/watchlist/apibloc.dart';
import 'package:flutter/rendering.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen(this.items, {super.key});
  final List<Apidata> items;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(items[index].name),
    //       subtitle: Text(items[index].contacts),
    //     );
    //   },
    // );

    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                          title: Text(items[index].name),
                          subtitle: Text(items[index].contacts),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset('lib/assets/images/person.jpg'),
                          )),
                    ),
                  ),
                );
              },
              childCount: items.length, // Set the child count here
            ),
          ),
        ),
      ],
    );
  }
}
