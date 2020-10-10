import 'package:flutter/material.dart';

class MyBottomNavigation extends StatelessWidget {
  final double fabSize = 62;
  final double navHeight = 68;
  final double fabMargin = 8;

  const MyBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: navHeight + fabSize / 2,
      child: Stack(
        children: [
          CustomPaint(
            painter: _MyBottomNavigationCustomPainter(0.5, fabSize, fabMargin),
            size: Size(
              double.infinity,
              navHeight + fabSize / 2,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: fabSize,
              height: fabSize,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyBottomNavigationCustomPainter extends CustomPainter {
  final double targetXPercent;
  final double fabSize;
  final double fabMargin;

  _MyBottomNavigationCustomPainter(
    this.targetXPercent,
    this.fabSize,
    this.fabMargin,
  );

  @override
  void paint(Canvas canvas, Size size) {
    double holeWidth = 100;
    double holeWidthThird = (holeWidth / 3) * 2;
    double holeHeight = fabSize + fabMargin;

    double top = fabSize / 2;

    Path p = new Path();

    final targetX = size.width * targetXPercent;

    p.moveTo(0, top);

    final point1 = Offset(targetX - holeWidthThird, top);
    p.lineTo(point1.dx, point1.dy);

    final point2 = Offset(targetX, holeHeight);

    final controlPoint1 = Offset(point1.dx + 25, top);
    final controlPoint2 = Offset(point1.dx + 30, holeHeight);

    p.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      point2.dx,
      point2.dy,
    );

    final point3 = Offset(targetX + holeWidthThird, top);
    final controlPoint3 = Offset(point3.dx - 30, holeHeight);
    final controlPoint4 = Offset(point3.dx - 25, top);

    p.cubicTo(
      controlPoint3.dx,
      controlPoint3.dy,
      controlPoint4.dx,
      controlPoint4.dy,
      point3.dx,
      point3.dy,
    );

    p.lineTo(size.width, top);
    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.lineTo(0, top);

    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(
        p,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);
  }

  void drawPoint(Canvas canvas, Offset point) {
    canvas.drawCircle(point, 3, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
