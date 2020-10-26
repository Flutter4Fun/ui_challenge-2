import 'package:flutter/material.dart';
import 'package:ui_challenge_2/player_item.dart';
import 'horizontal_snapping_list.dart';
import 'mock_models.dart';

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
          itemCount: players.length,
          itemBuilder: (context, i) => PlayerItemWidget(playerModel: players[i]),
        ),
      ),
    );
  }
}

