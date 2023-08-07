import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/routetwo.dart';

class RouteOne extends StatelessWidget {
  const RouteOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RouteTwo()),
                    );

              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //       pageBuilder: (context, animation, secondaryAnimation) =>
              //           const RouteTwo(),
              //       transitionsBuilder:
              //           (context, animation, secondaryAnimation, child) {
              //         const begin = Offset(1.0, 0.0);
              //         const end = Offset.zero;
              //         const curve = Curves.easeInOut;
              //         var tween = Tween(begin: begin, end: end)
              //             .chain(CurveTween(curve: curve));
              //         var offsetAnimation = animation.drive(tween);
              //         return SlideTransition(
              //           position: offsetAnimation,
              //           child: child,
              //         );
              //       }),
              // );
            },
            child: const Text('Go to Route2')),
      ),
    );
  }
}
