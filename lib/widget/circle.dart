// import 'dart:math' as math;
// import 'package:flutter/material.dart';

// class Circle extends CustomPainter {
//   double PI = math.pi;

//   Circle({
//     required this.value,
//   });

//   int value = 0;
//   var minValue = 5;
//   var maxValue = 35;

//   double degreeToRadian(double degree) {
//     return degree * PI / 180;
//   }

//   double radianToDegree(double radian) {
//     return radian * 180 / PI;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     var archAngle = PI /6;
//     var gapAngle = degreeToRadian(3);

//     var paint1 = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10;

//     var startAngel180 = PI;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,    //radians
//           height: size.height,   //radians
//         ),
//         startAngel180, //radians
//         archAngle - gapAngle, //radians
//         false,
//         paint1);

//     //draw arc of 210 to 240 degree
//     var startAngel210 = (7* PI) / 6;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         startAngel210, //radians
//         (archAngle - gapAngle), //radians
//         false,
//         paint1);

//     //draw arc of 240 to 270 degree
//     var startAngel240 = (4 * PI) / 3;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         startAngel240, //radians
//         (archAngle - gapAngle), //radians
//         false,
//         paint1);

//     /// green parts

//     var paint2 = Paint()
//       ..color = Colors.green
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10;

//     //draw arc of 270 to 300 degree
//     var startAngel270 = (3 * PI) / 2;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         startAngel270, //radians
//         (archAngle - gapAngle), //radians
//         false,
//         paint2);

//     //draw arc of 300 to 330 degree
//     var startAngel300 = (5 * PI) / 3;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         startAngel300, //radians
//         (archAngle - gapAngle), //radians
//         false,
//         paint2);

//     //draw arc of 330 to 360 degree
//     var startAngel330 = (11 * PI) / 6;
//     canvas.drawArc(
//         Rect.fromCenter(
//           center: Offset(size.width / 2, size.height / 2),
//           width: size.width,
//           height: size.height,
//         ),
//         startAngel330, //radians
//         (archAngle), //radians
//         false,
//         paint2);

//     // Draw the pivot circle.
//     Paint pivotPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       6,
//       pivotPaint,
//     );

//     // Draw the needle.
//     var circleRadius = size.width / 2;
//     var needleLength = (circleRadius) * 0.8;

//     if (value < minValue) {
//       value = minValue;
//     }
//     if (value > maxValue) {
//       value = maxValue;
//     }

//     var degreeVal = ((value - minValue) * PI) / (maxValue - minValue);

//     // if 30
//     var needleEndX = circleRadius - (needleLength * math.cos(degreeVal));
//     var needleEndY = circleRadius - (needleLength * math.sin(degreeVal));

//     Paint needlePaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3;
//     canvas.drawLine(
//       Offset(size.width / 2, size.height / 2),
//       Offset(needleEndX, needleEndY),
//       needlePaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }