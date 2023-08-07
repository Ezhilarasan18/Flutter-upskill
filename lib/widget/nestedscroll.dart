import 'package:flutter/material.dart';

class Nestedscroll extends StatelessWidget {
  const Nestedscroll({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('NestedScrollView Example'),
            bottom:const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ],
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 400.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'lib/assets/images/person.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                ),
               const Center(
                  child: Text('Tab 2 content'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
