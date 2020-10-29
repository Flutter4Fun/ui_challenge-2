import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_2/new_games_section.dart';
import 'package:ui_challenge_2/stories_section.dart';
import 'curved_bottom_navigation.dart';
import 'heading_section.dart';
import 'popular_games_section.dart';
import 'recommended_games_section.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SafeArea(child: HeadingSection()),
              StoriesSection(),
              SizedBox(
                height: 22,
              ),
              PopularGamesSection(),
              RecommendedGamesSection(),
              NewGamesSection(),
              SizedBox(
                height: 120,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 30,
                    spreadRadius: 40
                  )
                ]
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedBottomNavigation(
              selected: 2,
              items: [
                Icon(Icons.search, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.notifications, color: Colors.white),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}
