import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/tasks.dart';
import 'package:flutter_task_app/widgets/task_list.dart';
import 'dart:math' as math;

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const id = 'test_screen';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

// class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
//   var _sides = 3.0;

//   late Animation<double> animation;
//   late AnimationController controller;

//   late Animation<double> animation2;
//   late AnimationController controller2;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4),
//     );

//     controller2 = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4),
//     );

//     Tween<double> _radiusTween = Tween(begin: 0.0, end: 200);
//     Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

//     animation = _rotationTween.animate(controller)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.repeat();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       });

//     animation2 = _radiusTween.animate(controller2)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         // if (status == AnimationStatus.completed) {
//         //   controller2.reverse();
//         // } else if (status == AnimationStatus.dismissed) {
//         //   controller2.forward();
//         // }
//       });

//     controller.forward();
//     controller2.forward();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: AnimatedBuilder(
//                 animation: animation,
//                 builder: (context, snapshot) {
//                   return CustomPaint(
//                     painter:
//                         ShapePainter(_sides, animation2.value, animation.value),
//                     child: Container(),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 24.0),
//               child: Text('Sides'),
//             ),
//             Slider(
//               value: _sides,
//               min: 3.0,
//               max: 10.0,
//               label: _sides.toInt().toString(),
//               divisions: 7,
//               onChanged: (value) {
//                 setState(() {
//                   _sides = value;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // FOR PAINTING POLYGONS
// class ShapePainter extends CustomPainter {
//   final double sides;
//   final double radius;
//   final double radians;
//   ShapePainter(this.sides, this.radius, this.radians);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.teal
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     var path = Path();

//     var angle = (math.pi * 2) / sides;

//     Offset center = Offset(size.width / 2, size.height / 2);
//     Offset startPoint =
//         Offset(radius * math.cos(radians), radius * math.sin(radians));

//     path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

//     for (int i = 1; i <= sides; i++) {
//       double x = radius * math.cos(radians + angle * i) + center.dx;
//       double y = radius * math.sin(radians + angle * i) + center.dy;
//       path.lineTo(x, y);
//     }
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  Tween<double> _radiusTween = Tween(begin: 0.0, end: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = _radiusTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Outer white container with padding
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: LayoutBuilder(
          // Inner yellow container
          builder: (_, constraints) => Container(
            width: constraints.widthConstraints().maxWidth,
            height: constraints.heightConstraints().maxHeight,
            // color: Colors.yellow,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                return CustomPaint(
                  painter: CurvedPainter(animation.value),
                  child: Container(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class FaceOutlinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define a paint object
//     final paint = Paint();
//     // ..style = PaintingStyle.stroke
//     // ..strokeWidth = 4.0
//     paint.color = Color.fromARGB(255, 207, 213, 252);

//     var rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     canvas.drawRect(rect, paint);
//     paint.color = Color.fromARGB(255, 6, 30, 186);
//     var center = Offset(size.width / 2, size.height / 2);
//     canvas.drawCircle(center, 75.0, paint);
//     paint.color = Colors.red;

//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 4.0;

//     canvas.drawOval(
//       Rect.fromLTWH(size.width - 120, 40, 100, 100),
//       paint,
//     );

//     final mouth = Path();
//     mouth.moveTo(size.width * 0.5, size.height * 0.3);
//     mouth.arcToPoint(
//       Offset(0, size.height * 0.4),
//       radius: Radius.circular(150),
//     );
//     mouth.moveTo(size.width, 0);
//     mouth.arcToPoint(
//       Offset(size.width * 0.5, size.height * 0.3),
//       radius: Radius.circular(150),
//     );

//     canvas.drawPath(mouth, paint);

//     final line = Path();
//     line.moveTo(200, 200);
//     line.lineTo(0, 300);

//     canvas.drawPath(line, paint);

// // Left eye
// canvas.drawRRect(
//   RRect.fromRectAndRadius(
//       Rect.fromLTWH(20, 40, 50, 50), Radius.circular(20)),
//   paint,
// );
// // Right eye
// canvas.drawOval(
//   Rect.fromLTWH(size.width - 120, 40, 100, 100),
//   paint,
// );
// Mouth
// final mouth = Path();
// //width
// mouth.moveTo(0, 20);
// mouth.lineTo(200, 20);

// mouth.arcToPoint(
//   Offset(size.width * 0.8, size.height * 0.5),
//   radius: Radius.circular(400),
//   clockwise: false,
// );

// mouth.arcToPoint(
//   Offset(size.width * 0.2, size.height * 0.2),
//   radius: Radius.circular(400),
//   clockwise: true,
// );

// canvas.drawPath(mouth, paint);
// }

//   @override
//   bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
// }

// class PacmanPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var center = size / 2;
//     var pi = 3.141592653589;

//     var paint = Paint()..color = Colors.yellow;
//     canvas.drawArc(
//       Rect.fromCenter(
//         center: Offset(center.width, center.height),
//         width: 150,
//         height: 150,
//       ),
//       0,
//       2 * pi,
//       true,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

class CurvedPainter extends CustomPainter {
  final double radius;
  CurvedPainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Change this to
    final bdr = _borderRRect(size);
    canvas.drawRRect(bdr, paint);

    paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 3; // Change t
    final pinRect = _pinRect(bdr);
    canvas.drawArc(pinRect, math.pi / 2, -math.pi, true, paint);

    paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    // Change t

    final chargeRRect = _chargeRRect(bdr, 5.0, radius);
    canvas.drawRRect(chargeRRect, paint);

    // final rect = Rect.fromLTWH(left, top, width * charge, height);
//     var paint = Paint();
//     paint.color = Colors.pink;
//     paint.style = PaintingStyle.fill; // Change this to fill

//     var path = Path();

//     path.moveTo(0, size.height * 0.5);
//     path.quadraticBezierTo(size.width * 0.25, size.height * 0.8,
//         size.width * 0.5, size.height * 0.5);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.2, size.width, size.height * 0.5);
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);

//     canvas.drawPath(path, paint);

//     paint = Paint()
//       ..strokeWidth = 5
//       ..color = Colors.indigoAccent
//       ..style = PaintingStyle.stroke;

//     final triangle = Path();
//     triangle.moveTo(150, 0);
//     triangle.relativeLineTo(100, 100);
//     triangle.relativeLineTo(-150, 0);
//     triangle.close();

//     canvas.drawPath(triangle, paint);

//     final square1 = Path();
//     // 1
//     square1.moveTo(50, 150);
//     // 2
//     square1.relativeLineTo(100, 0);
//     // 3
//     square1.relativeLineTo(0, 100);
//     // 4
//     square1.relativeLineTo(-100, 0);
//     // 5
//     square1.close();

//     const square2 = Rect.fromLTWH(200, 150, 100, 100);
//     canvas.drawPath(square1, paint);
//     canvas.drawRect(square2, paint);
//     final hexagon = Path()
// // 1
//       ..moveTo(175, 300)
// // 2
//       ..relativeLineTo(75, 50)
// // 3
//       ..relativeLineTo(0, 75)
// // 4
//       ..relativeLineTo(-75, 50)
// // 5
//       ..relativeLineTo(-75, -50)
// // 6
//       ..relativeLineTo(0, -75)
// // 7
//       ..close();
//     canvas.drawPath(hexagon, paint);
//     final cross = Path()
//       ..moveTo(150, 500)
//       ..relativeLineTo(50, 0)
//       ..relativeLineTo(0, 50)
//       ..relativeLineTo(50, 0)
//       ..relativeLineTo(0, 50)
//       ..relativeLineTo(-50, 0)
//       ..relativeLineTo(0, 50)
//       ..relativeLineTo(-50, 0)
//       ..relativeLineTo(0, -50)
//       ..relativeLineTo(-50, 0)
//       ..relativeLineTo(0, -50)
//       ..relativeLineTo(50, 0)
//       ..close();
//     canvas.drawPath(cross, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

final margin = 10.0;

RRect _borderRRect(Size size) {
  // 1
  final symmetricalMargin = margin * 2;
  // 2
  final width = size.width - symmetricalMargin - 10.0 - 20.0;
  // 3
  final height = width / 2;
  // 4
  final top = (size.height / 2) - (height / 2);
  // 5
  final radius = Radius.circular(height * 0.2);
  // 6
  final bounds = Rect.fromLTWH(margin, top, width, height);
  // 7
  return RRect.fromRectAndRadius(bounds, radius);
}

Rect _pinRect(RRect bdr) {
  // 1
  // final center = Offset(bdr.right + 10.0, bdr.top + (bdr.height / 2.0));
  final center = Offset(bdr.right + 10, bdr.top + (bdr.height / 2.0));
  // 2
  final height = bdr.height * 0.38;
  // 3
  final width = 40.0;
  // 4
  return Rect.fromCenter(center: center, width: width, height: height);
}

RRect _chargeRRect(RRect bdr, double padding, double charge) {
  // final percent = ((30 / 100).round());
  final percent = 0.2 * ((charge / 0.2).round());
  final left = bdr.left + padding;
  final top = bdr.top + padding;
  final right = bdr.right - padding;
  final bottom = bdr.bottom - padding;
  final height = bottom - top;
  final width = right - left;
  final radius = Radius.circular(height * 0.15);
  final rect = Rect.fromLTWH(left, top, width * percent, height);
  return RRect.fromRectAndRadius(rect, radius);
}
