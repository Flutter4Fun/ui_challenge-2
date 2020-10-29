import 'package:flutter/material.dart';
import 'dart:math' as math;

class HorizontalSnappingList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double itemWidth;
  final double itemHorizontalMargin;
  final double listHeight;
  final double itemsConsumedWidth;

  HorizontalSnappingList({
    @required this.itemBuilder,
    this.itemCount,
    this.itemWidth = 120.0,
    this.itemHorizontalMargin = 4.0,
    this.listHeight = 200.0,
  }) : itemsConsumedWidth = itemWidth + (itemHorizontalMargin * 2);

  @override
  _HorizontalSnappingListState createState() => _HorizontalSnappingListState();
}

class _HorizontalSnappingListState extends State<HorizontalSnappingList> {
  ScrollController _scrollController;
  double scrollOffset = 0;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.position.pixels / widget.itemsConsumedWidth;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.listHeight,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 12),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: SnappingListScrollPhysic(
            itemWidth: widget.itemWidth + (widget.itemHorizontalMargin * 2)),
        itemCount: widget.itemCount,
        itemBuilder: (context, i) {
          double scale = ((1 - math.min((i - scrollOffset).abs(), 1.0)) * (1 - 0.85)) + 0.85;
          return Transform.scale(
            scale: scale,
            child: widget.itemBuilder(context, i),
          );
        },
      ),
    );
  }
}

class SnappingListScrollPhysic extends ScrollPhysics {
  final double itemWidth;

  const SnappingListScrollPhysic({
    @required this.itemWidth,
    ScrollPhysics parent,
  }) : super(parent: parent);

  @override
  SnappingListScrollPhysic applyTo(ScrollPhysics ancestor) => SnappingListScrollPhysic(
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
