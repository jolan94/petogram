import 'package:petogram/models/post.dart';
import 'package:petogram/models/story.dart';
import 'package:petogram/models/user.dart';

List<Story> dummyStories = [
  Story(
    imageUrl: 'assets/john.jpeg',
    name: 'John',
  ),
  Story(
    imageUrl: 'assets/emily.jpeg',
    name: 'Emily',
  ),
  Story(
    imageUrl: 'assets/sarah.jpeg',
    name: 'Sarah',
  ),
  // Add more dummy stories here...
];

List<Post> dummyPosts = [
  Post(
    imageUrl: 'assets/dog1.jpeg',
    caption: 'Having a great time with my pet!',
    likeCount: 10,
  ),
  Post(
    imageUrl: 'assets/cat1.jpeg',
    caption: 'Look at this cute little friend!',
    likeCount: 15,
  ),
  Post(
    imageUrl: 'assets/dog2.jpeg',
    caption: 'Enjoying a walk in the park.',
    likeCount: 20,
  ),
  Post(
    imageUrl: 'assets/dog3.jpeg',
    caption: 'Enjoying a walk in the park.',
    likeCount: 20,
  ),
  // Add more dummy posts here...
];
