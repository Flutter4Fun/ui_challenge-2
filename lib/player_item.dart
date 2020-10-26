import 'package:flutter/material.dart';
import 'package:ui_challenge_2/sizes.dart';

class PlayerModel {
  final Color bgColor;
  final String image, name, description;
  final bool isFavorite;
  final double rank;
  final double imageScale;

  PlayerModel({
    @required this.bgColor,
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.isFavorite,
    @required this.rank,
    this.imageScale = 1.0,
  });
}

class PlayerItemWidget extends StatelessWidget {
  final PlayerModel playerModel;

  const PlayerItemWidget({
    Key key,
    @required this.playerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      height: itemHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.network(
              'https://img.techpowerup.org/201025/items-bg.png',
              color: playerModel.bgColor,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 46.0, left: 10),
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 18,
              ),
              Image.network(
                playerModel.image,
                width: itemWidth * 0.85 * playerModel.imageScale,
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      playerModel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            playerModel.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            playerModel.rank.toStringAsFixed(1),
                            style: TextStyle(
                                color: playerModel.bgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
