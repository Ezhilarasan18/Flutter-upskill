// import 'package:flutter/material.dart';
// import 'package:designtraining/category/categorycard.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         height: 70,
//         color: Colors.red,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             BottomNavItems(
//               press: () {},
//             ),
//             BottomNavItems(
//               press: () {},
//             ),
//             BottomNavItems(
//               press: () {},
//             ),
//             BottomNavItems(
//               press: () {},
//             )
//           ],
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45,
//             decoration: const BoxDecoration(
//                 color: Colors.pink,
//                 image: DecorationImage(
//                     alignment: Alignment.centerLeft,
//                     image: NetworkImage(
//                         'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Shaqi_jrvej.jpg/1200px-Shaqi_jrvej.jpg'))),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         width: 52,
//                         height: 52,
//                         decoration: const BoxDecoration(
//                             color: Colors.amber, shape: BoxShape.circle),
//                         child: Image.network(
//                             'https://assets.stickpng.com/images/588a64e7d06f6719692a2d11.png'),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'datasdfds\n fsdfdsf',
//                     style: TextStyle(color: Colors.black, fontSize: 25),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: const TextField(
//                       decoration: InputDecoration(
//                           hintText: 'search', border: InputBorder.none),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         childAspectRatio: .85,
//                         mainAxisSpacing: 20,
//                         crossAxisSpacing: 20,
//                         children: <Widget>[
//                           CategoryWidget(
//                             title: 'dsfdsfdsf',
//                             img:
//                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg',
//                             press: () {},
//                           ),
//                           CategoryWidget(
//                             title: 'dsfdsfdsf',
//                             img:
//                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg',
//                             press: () {},
//                           ),
//                           CategoryWidget(
//                             title: 'dsfdsfdsf',
//                             img:
//                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg',
//                             press: () {},
//                           ),
//                           CategoryWidget(
//                             title: 'dsfdsfdsf',
//                             img:
//                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg',
//                             press: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BottomNavItems extends StatelessWidget {
//   const BottomNavItems({super.key, required this.press, this.isactive = false});
//   final VoidCallback press;
//   final bool isactive;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Icon(Icons.home_filled),
//          Text('Home',style: TextStyle(color: isactive?Colors.red:Colors.white),)
//         ],
//       ),
//     );
//   }
// }

// import 'package:evaluation_one/mobx/counter/counter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:evaluation_one/widget/dashboardcounter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MobX Counter Example',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   CounterStore _counter=CounterStore();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MobX Counter Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 20),
//             Observer(
//               builder: (context){
//                 return Text('${_counter.counter}');
//               }
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 _counter.increment();
//               },
//               child: Text('Increment Counter'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _counter.decrement();
//                 // Use the increment action to modify the state.
//               },
//               child: Text('Decrement Counter'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                   return  Dashboard(countervalue:_counter);
//                 }));
//               },
//               child: Text('Nav'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:evaluation_one/widget/watchlistaddscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:evaluation_one/mobx/mobxstore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Data Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final DataStore dataStore;

  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataStore dataStore = DataStore(); // Initialize the DataStore
  @override
  void initState() {
    super.initState();
    dataStore.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Data Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                if (dataStore.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: dataStore.data.length,
                    itemBuilder: (context, index) {
                      final item = dataStore.data[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('ID: ${item.id}'),
                      );
                    },
                  );
                }
              },
            ),
          ),
          TextField(
            onChanged: (newValue) {
              dataStore.setTextvalue(newValue);
            },
          ),
          Observer(
            builder: (context) {
              return Text(dataStore.textValue.value.toString());
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Watchlistaddscreen(store: dataStore);
                }));
              },
              child: Text('Nav'))
        ],
      ),
    );
  }
}
