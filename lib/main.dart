import 'package:flutter/material.dart';
import 'package:ui_challenge_2/horizontal_snapping_list.dart';

import 'game_item.dart';
import 'mock_models.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 4 Fun'),
      ),
      body: Center(
        child: HorizontalSnappingList(
          itemWidth: 188.0,
          itemHorizontalMargin: 0,
          itemCount: games.length,
          itemBuilder: (context, i) => GameItemWidget(gameModel: games[i]),
        ),
      ),
    );
  }
}
