// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() => runApp(SpeedometerApp());

// class SpeedometerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SpeedometerPage(),
//     );
//   }
// }

// class SpeedometerPage extends StatefulWidget {
//   @override
//   _SpeedometerPageState createState() => _SpeedometerPageState();
// }

// class _SpeedometerPageState extends State<SpeedometerPage> {
//   double _speedValue = 0.0; // Initial speed value
//   final int divisions = 6; // Number of division bars

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speedometer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Enter Speed:'),
//             SizedBox(height: 50.0),
//             TextField(
//               keyboardType: TextInputType.number,
//               onChanged: (text) {
//                 setState(() {
//                   _speedValue = double.tryParse(text) ?? 0.0;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Speed (0-100)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Speedometer(speedValue: _speedValue, divisions: divisions),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Speedometer extends StatelessWidget {
//   final double speedValue;
//   final int divisions;

//   Speedometer({required this.speedValue, required this.divisions});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
      
//       width: 600.0,
//       height: 200.0,
//       child: Transform.rotate(
//         angle: -pi / 2,
//         child: 
//         CustomPaint(
//           painter: SpeedometerPainter(speedValue: speedValue, divisions: divisions),
//         ),
//       ),
//     )
//     );
//   }
// }

// class SpeedometerPainter extends CustomPainter {
//   final double speedValue;
//   final int divisions;

//   SpeedometerPainter({required this.speedValue, required this.divisions});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()..style = PaintingStyle.fill;

//     final double centerX = size.width / 2;
//     final double centerY = size.height;

//     final double radius = size.height / 2;
//     final double startAngle = -pi / 2;
//     final double sweepAngle = pi;

//     final double divisionAngle = sweepAngle / divisions;
//     final double divisionWidth = 15.0; // Increase the bar width here

//     // Draw division bars with different colors
//     for (int i = 0; i < divisions; i++) {
//       final double angle = startAngle + i * divisionAngle;
//       final double x1 = centerX + (radius - divisionWidth / 2) * cos(angle);
//       final double y1 = centerY + (radius - divisionWidth / 2) * sin(angle);
//       final double x2 = centerX + (radius + divisionWidth / 2) * cos(angle);
//       final double y2 = centerY + (radius + divisionWidth / 2) * sin(angle);

//       switch (i) {
//         case 0:
//           paint.color = Colors.red;
//           break;
//         case 1:
//           paint.color = Colors.orange;
//           break;
//         case 2:
//           paint.color = Colors.yellow;
//           break;
//         case 3:
//           paint.color = Colors.green;
//           break;
//         case 4:
//           paint.color = Colors.blue;
//           break;
//         default:
//           paint.color = Colors.grey;
//           break;
//       }

//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
//     }

//     // Calculate the position for the needle
//     final double angle = (speedValue / 100) * sweepAngle - pi / 2;
//     final double needleLength = radius - 10.0;
//     final double needleX = centerX + needleLength * cos(angle);
//     final double needleY = centerY + needleLength * sin(angle);

//     // Draw the needle
//     paint.color = Colors.black;
//     paint.strokeWidth = 3.0;
//     canvas.drawLine(Offset(centerX, centerY), Offset(needleX, needleY), paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
