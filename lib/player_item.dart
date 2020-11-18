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
  final double height;
  final double width;

  const PlayerItemWidget({
    Key key,
    @required this.playerModel,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/items_bg.png',
              color: playerModel.bgColor,
              package: 'ui_challenge_2',
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
                height: 14,
              ),
              Image.asset(
                playerModel.image,
                width: width * 0.8 * playerModel.imageScale,
                package: 'ui_challenge_2'
              ),
              Expanded(child: Container()),
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
              ),
              SizedBox(
                height: 22,
              )
            ],
          )
        ],
      ),
    );
  }
}
