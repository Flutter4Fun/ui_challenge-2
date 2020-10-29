import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_2/new_games_section.dart';
import 'package:ui_challenge_2/stories_section.dart';
import 'heading_section.dart';
import 'popular_games_section.dart';
import 'recommended_games_section.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(child: HeadingSection()),
          StoriesSection(),
          SizedBox(
            height: 22,
          ),
          PopularGamesSection(),
          RecommendedGamesSection(),
          NewGamesSection()
        ],
      ),
    );
  }
}