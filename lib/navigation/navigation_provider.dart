import 'package:flutter/material.dart';
import 'package:evaluation_one/widget/namedroutethree.dart';

class NavigationProvider{
   static void pushToSecondScreen(BuildContext context) {
    Navigator.pushNamed(context, '/second');
  }

   static void pushToThirdScreen(BuildContext context) {
    Navigator.push(context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const NamedRouteThree(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    }));
  }
}