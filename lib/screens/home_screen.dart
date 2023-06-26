import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/story_item.dart';
import '../widgets/post_item.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeViewModel.stories.length,
              itemBuilder: (ctx, index) {
                final story = homeViewModel.stories[index];
                return StoryItem(story: story);
              },
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeViewModel.posts.length,
            itemBuilder: (ctx, index) {
              final post = homeViewModel.posts[index];
              return PostItem(post: post);
            },
          ),
        ],
      ),
    );
  }
}
