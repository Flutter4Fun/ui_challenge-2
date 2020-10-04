import 'dart:math' as math;

import 'package:flutter/material.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller;
  int firstItem = 0;
  final double itemWidth = 128;

  final ValueNotifier<double> _offsett = ValueNotifier<double>(0.0);

  double offset = 0;

  @override
  void initState() {
    _controller = new ScrollController();
    _controller.addListener(() {
      setState(() {
        offset = _controller.position.pixels / itemWidth;
        firstItem = _controller.position.pixels ~/ itemWidth;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Center(
        child: SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: ListView.builder(
            controller: _controller,
            physics: SnappingListScrollPhysics(itemWidth: itemWidth),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              double othersScale = 0.8;
              double scale = ((1 - math.min((i - offset).abs(), 1.0)) * (1 - othersScale)) + othersScale;
              print('i: $i, scale: $scale');
              return Transform.scale(
                scale: scale,
                child: _buildCarouselItem(context, 0, i),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Container(
      width: 120,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Center(
        child: Text(
          '$itemIndex',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class SnappingListScrollPhysics extends ScrollPhysics {
  final double itemWidth;

  const SnappingListScrollPhysics({
    @required this.itemWidth,
    ScrollPhysics parent,
  }) : super(parent: parent);

  @override
  SnappingListScrollPhysics applyTo(ScrollPhysics ancestor) => SnappingListScrollPhysics(
        parent: buildParent(ancestor),
        itemWidth: itemWidth,
      );

  double _getItem(ScrollPosition position) => (position.pixels) / itemWidth;

  double _getPixels(ScrollPosition position, double item) =>
      math.min(item * itemWidth, position.maxScrollExtent);

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double item = _getItem(position);
    if (velocity < -tolerance.velocity) {
      item -= 0.5;
    } else if (velocity > tolerance.velocity) {
      item += 0.5;
    }
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
