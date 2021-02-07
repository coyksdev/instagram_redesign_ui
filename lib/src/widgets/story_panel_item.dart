import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/story.dart';

class StoryPanelItem extends StatelessWidget {
  const StoryPanelItem({
    Key key,
    @required this.story,
  }) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff9F8B9F), width: 4),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: story.user.image,
                ),
              ),
            ),
          ),
          if (story.canCreateStory)
            Positioned(
              bottom: 8,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink,
                      Colors.purple,
                    ],
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          if (!story.canCreateStory) ...[
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                story.user.name,
                style: TextStyle(color: Colors.black54),
              ),
            )
          ]
        ],
      ),
    );
  }
}
