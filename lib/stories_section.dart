import 'package:flutter/material.dart';

import 'dashed_circle.dart';

final storyRadius = 32.0;

class UserStoryWidget extends StatelessWidget {
  final String url;

  const UserStoryWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return DashedCircle(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: CircleAvatar(
          radius: storyRadius,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(url, package: 'ui_challenge_2'),
        ),
      ),
      dashes: 40,
      gapSize: 2,
      strokeWidth: 2.0,
      color: Colors.green,
    );
  }
}

List<String> users = [
  "assets/images/User1.png",
  "assets/images/User2.png",
  "assets/images/User3.png",
  "assets/images/User4.png",
  "assets/images/User1.png",
  "assets/images/User2.png",
  "assets/images/User3.png",
  "assets/images/User4.png",
];

class StoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: users.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          Widget widget;
          if (i == 0) {
            widget = Container(
              width: storyRadius * 2,
              height: storyRadius * 2,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0B0A0A),
              ),
              child: Image.asset('assets/images/AddStory.png', package: 'ui_challenge_2'),
            );
          } else {
            widget = UserStoryWidget(users[i - 1]);
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(child: widget),
          );
        },
      ),
    );
  }
}