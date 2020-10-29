import 'package:flutter/material.dart';

import 'horizontal_snapping_list.dart';
import 'player_item.dart';
import 'sizes.dart';

final itemHeight = 190.0;
final itemWidth = itemHeight * 0.7;


final player1 = PlayerModel(
  bgColor: Color(0xFF7AF2F3),
  image: 'https://img.techpowerup.org/201025/player1.png',
  name: 'Jetpack Joy',
  description: 'Action packed desi quiz Game',
  isFavorite: false,
  rank: 4.9,
);

final player2 = PlayerModel(
  bgColor: Color(0xFFFFC300),
  image: 'https://img.techpowerup.org/201026/player2.png',
  name: 'X Fighter',
  description: 'Battle Royale',
  isFavorite: true,
  rank: 4.6,
  imageScale: 1.5,
);

final player3 = PlayerModel(
  bgColor: Color(0xFFFF6D62),
  image: 'https://img.techpowerup.org/201026/player3.png',
  name: 'Ninja Race',
  description: 'Real time racing',
  isFavorite: false,
  rank: 4.0,
);

List<PlayerModel> players = [
  player1,
  player2,
  player3,
  player1,
  player2,
  player3,
  player1,
  player2,
  player3,
];

class PopularGamesSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child:
          Text('Recently Released', style: TextStyle(color: Color(0xFF7B7B7B), fontSize: 12)),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Row(
            children: [
              Text('Popular Games', style: TextStyle(color: Colors.black, fontSize: 22)),
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
          listHeight: itemHeight,
          itemWidth: itemWidth,
          itemHorizontalMargin: 0,
          itemCount: players.length,
          itemBuilder: (context, i) {
            return PlayerItemWidget(
              playerModel: players[i],
              height: itemHeight,
              width: itemWidth,
            );
          },
        )
      ],
    );
  }
}