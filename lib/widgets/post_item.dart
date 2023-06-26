import 'package:flutter/material.dart';
import '../models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/john.jpeg'),
            ),
            SizedBox(width: 10),
            Text('John'),
          ],
        ),
        const SizedBox(height: 10),
        Image.network(post.imageUrl),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        Text(post.caption),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            Text('${post.likeCount} Likes'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
