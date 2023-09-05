// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Speedometer(),
//     );
//   }
// }

// class Speedometer extends StatefulWidget {
//   @override
//   _SpeedometerState createState() => _SpeedometerState();
// }

// class _SpeedometerState extends State<Speedometer> {
//   double userInput = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Semi-Circle Speedometer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SpeedometerWidget(userInput: userInput),
//             SizedBox(height: 20),
//             TextField(
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   userInput = double.tryParse(value) ?? 0.0;
//                   userInput = userInput.clamp(0.0, 100.0); // Limit the input to 0-100
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Enter Value (0-100)',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SpeedometerWidget extends StatelessWidget {
//   final double userInput;

//   SpeedometerWidget({required this.userInput});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(200, 200), // Adjust the size as needed
//       painter: SpeedometerPainter(userInput: userInput),
//     );
//   }
// }

// class SpeedometerPainter extends CustomPainter {
//   final double userInput;

//   SpeedometerPainter({required this.userInput});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double centerX = size.width / 2;
//     final double centerY = size.height;

//     final double radius = size.height;
//     final double startAngle = pi;
//     final double endAngle = 0;

//     final Paint outerCirclePaint = Paint()
//       ..color = Colors.grey
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10.0;

//     final Paint innerCirclePaint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     final Paint needlePaint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5.0;

//     // Draw the outer semi-circle
//     canvas.drawArc(
//       Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
//       startAngle,
//       endAngle,
//       false,
//       outerCirclePaint,
//     );

//     // Draw the inner semi-circle
//     canvas.drawArc(
//       Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - 10),
//       startAngle,
//       endAngle,
//       false,
//       innerCirclePaint,
//     );

//     // Draw tick marks (adjust as needed, showing only six bars)
//     for (int i = 0; i <= 180; i += 30) {
//       final angle = startAngle + (i * (pi / 180));
//       final tickStartX = centerX + (radius - 20) * cos(angle);
//       final tickStartY = centerY + (radius - 20) * sin(angle);
//       final tickEndX = centerX + (radius - 10) * cos(angle);
//       final tickEndY = centerY + (radius - 10) * sin(angle);

//       canvas.drawLine(
//         Offset(tickStartX, tickStartY),
//         Offset(tickEndX, tickEndY),
//         outerCirclePaint,
//       );
//     }

//     // Calculate and draw the needle
//     final angle = startAngle+ (userInput / 100 * pi);
//     final needleX = centerX + (radius - 40) * cos(angle);
//     final needleY = centerY + (radius - 40) * sin(angle);

//     canvas.drawLine(
//       Offset(centerX, centerY),
//       Offset(needleX, needleY),
//       needlePaint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
