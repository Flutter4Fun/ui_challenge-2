import 'package:flutter/material.dart';
import 'package:ui_challenge_2/sizes.dart';

import 'game_item.dart';
import 'horizontal_snapping_list.dart';

final game1 = GameModel(
  image: 'https://img.techpowerup.org/201029/game1.png',
  title: 'Road Fight',
  subtitle: 'Shooting Cars',
);

final game2 = GameModel(
  image: 'https://img.techpowerup.org/201029/game2.png',
  title: 'Vikings',
  subtitle: 'Sons of Ragnar',
);

List<GameModel> games = [
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
  game1,
  game2,
];

class RecommendedGamesSection extends StatelessWidget {

  final itemSize = 142.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Row(
            children: [
              Text('Recommended Games', style: TextStyle(color: Colors.black, fontSize: 22)),
              Expanded(child: Container()),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8,),
        HorizontalSnappingList(
          listHeight: itemSize,
          itemWidth: itemSize,
          itemHorizontalMargin: 0,
          itemCount: games.length,
          itemBuilder: (context, i) {
            return GameItemWidget(
              gameModel: games[i],
              itemWidth: itemSize,
              itemHeight: itemSize,
            );
          },
        )
      ],
    );
  }
}