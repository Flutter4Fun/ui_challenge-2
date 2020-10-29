import 'package:flutter/material.dart';
import 'package:ui_challenge_2/game_item.dart';

import 'player_item.dart';

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