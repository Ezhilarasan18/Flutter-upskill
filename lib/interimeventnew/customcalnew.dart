import 'package:flutter/material.dart';

class MapGridView extends StatelessWidget {
  final Map<int, String> keyValueMap;

  MapGridView()
      : keyValueMap = Map.fromIterable(
          List.generate(30, (index) => index + 1),
          key: (key) => key,
          value: (key) => 'Item $key',
        );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust the number of columns
      ),
      itemCount: keyValueMap.length,
      itemBuilder: (context, index) {
        int key = keyValueMap.keys.elementAt(index);
        String value = keyValueMap[key]!;

        return GridTile(
          child: ListTile(
            title: Text('$key'),
            subtitle: Text(value),
          ),
        );
      },
    );
  }
}