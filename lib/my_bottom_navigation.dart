import 'package:flutter/material.dart';

class MyBottomNavigation extends ImplicitlyAnimatedWidget {
  final List<Widget> items;
  final double fabSize;
  final double navHeight;
  final double fabMargin;
  final double iconSize;
  final int selected;

  const MyBottomNavigation({
    Key key,
    @required this.items,
    this.fabSize = 62,
    this.navHeight = 68,
    this.fabMargin = 8,
    this.iconSize = 24,
    this.selected = 0,
  }) : super(key: key, duration: const Duration(milliseconds: 300));

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends AnimatedWidgetBaseState<MyBottomNavigation> {
  Tween<double> _selectedPercentTween;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.navHeight + widget.fabSize / 2,
      child: Stack(
        children: [
          CustomPaint(
            painter: _MyBottomNavigationCustomPainter(
              _selectedPercentTween.evaluate(animation),
              widget.fabSize,
              widget.fabMargin,
            ),
            size: Size(
              double.infinity,
              widget.navHeight + widget.fabSize / 2,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.navHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.items.asMap().entries.map((entry) {
                  final pos = entry.key;
                  final iconWidget = entry.value;
                  return Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Transform.translate(
                        offset: Offset(0, pos == widget.selected ? - (widget.fabSize / 2) - (widget.fabMargin / 2) : 0),
                        child: iconWidget,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    double itemSpace = 1 / widget.items.length;
    double selectedPercent = (itemSpace * widget.selected) + (itemSpace / 2);

    _selectedPercentTween = visitor(
      _selectedPercentTween,
      selectedPercent,
        (dynamic value) => Tween<double>(
        begin: value,
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

    canvas.drawCircle(Offset(targetX, fabSize / 2), fabSize / 2, Paint()..color = Colors.black);
  }

  void drawPoint(Canvas canvas, Offset point) {
    canvas.drawCircle(point, 3, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}