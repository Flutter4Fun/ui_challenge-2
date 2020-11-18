import 'package:flutter/material.dart';

class GameModel {
  final String image;
  final String title;
  final String subtitle;

  GameModel({
    this.image,
    this.title,
    this.subtitle,
  });
}

class GameItemWidget extends StatelessWidget {
  final double itemWidth;
  final double itemHeight;
  final GameModel gameModel;

  const GameItemWidget({
    Key key,
    this.itemWidth = 188.0,
    this.itemHeight = 200.0,
    @required this.gameModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      height: itemHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            gameModel.image,
            fit: BoxFit.fitHeight,
            package: 'ui_challenge_2',
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameModel.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  gameModel.subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
