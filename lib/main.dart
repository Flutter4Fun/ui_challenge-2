import 'package:flutter/material.dart';
import 'horizontal_snapping_list.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {

  final double itemWidth = 120.0;
  final double itemHeight = 200.0;
  final double horizontalItemMargin = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 4 Fun'),
      ),
      body: Center(
        child: HorizontalSnappingList(
          itemWidth: 120,
          itemHorizontalMargin: horizontalItemMargin,
          itemBuilder: (context, i) => Container(
            width: itemWidth,
            height: itemHeight,
            margin: EdgeInsets.symmetric(horizontal: horizontalItemMargin),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
