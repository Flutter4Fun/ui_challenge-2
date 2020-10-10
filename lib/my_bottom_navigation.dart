import 'package:flutter/material.dart';

class MyBottomNavigation extends StatelessWidget {

  final double curvePercent;

  const MyBottomNavigation({Key key, this.curvePercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MyBottomNavigationCustomPainter(curvePercent),
      size: Size(
        double.infinity,
        74,
      ),
    );
  }
}

class _MyBottomNavigationCustomPainter extends CustomPainter {

  final double targetXPercent;

  _MyBottomNavigationCustomPainter(this.targetXPercent);

  @override
  void paint(Canvas canvas, Size size) {

    double holeWidth = 100;
    double holeWidthHalf = holeWidth / 2;
    double holeHeight = 40;

    Path p = new Path();

    final targetX = size.width * targetXPercent;

    p.moveTo(0, 0);

    final point1 = Offset(targetX - holeWidthHalf, 0);
    p.lineTo(point1.dx, point1.dy);

    final point2 = Offset(targetX, holeHeight);

    final controlPoint1 = Offset(point1.dx + 30, 0);
    final controlPoint2 = Offset(point1.dx + 18, 40);

    p.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      point2.dx,
      point2.dy,
    );

    final point3 = Offset(targetX + holeWidthHalf, 0);
    final controlPoint3 = Offset(point3.dx - 18, 40);
    final controlPoint4 = Offset(point3.dx - 30, 0);

    p.cubicTo(
      controlPoint3.dx,
      controlPoint3.dy,
      controlPoint4.dx,
      controlPoint4.dy,
      point3.dx,
      point3.dy,
    );

    p.lineTo(size.width, 0);
    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.lineTo(0, 0);

    canvas.drawPath(
      p,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill
        ..strokeWidth = 2);
  }

  void drawPoint(Canvas canvas, Offset point) {
    canvas.drawCircle(point, 3, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
