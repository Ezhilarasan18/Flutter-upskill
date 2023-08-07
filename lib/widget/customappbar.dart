import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

 const CustomAppBar({required this.height,super.key});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:const Text('Your App Title'),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Add your menu icon functionality here.
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Add your search icon functionality here.
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Add your notifications icon functionality here.
          },
        ),
      ],
    );
  }
}
