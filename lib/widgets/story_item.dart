import 'package:flutter/material.dart';
import 'package:petogram/models/user.dart';
import '../models/story.dart';

class StoryItem extends StatelessWidget {
  final Story story;

  StoryItem({required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Image.network(story.imageUrl),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(story.imageUrl),
            ),
            const SizedBox(height: 5),
            Text(story.name),
          ],
        ),
      ),
    );
  }
}
