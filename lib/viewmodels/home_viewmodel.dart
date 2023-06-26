import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petogram/models/story.dart';
import 'package:petogram/models/post.dart';

class HomeViewModel extends ChangeNotifier {
  List<Story> stories = [];
  List<Post> posts = [];

  HomeViewModel() {
    fetchStories();
    fetchPosts();
  }

  Future<void> fetchStories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.npoint.io/926d7dbf8506d2b258c2/story'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        stories = jsonData.map((data) => Story.fromJson(data)).toList();
      } else {
        // Handle error response
        print('Error fetching stories. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error fetching stories: $error');
    }

    notifyListeners();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.npoint.io/926d7dbf8506d2b258c2/posts'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        posts = jsonData.map((data) => Post.fromJson(data)).toList();
      } else {
        // Handle error response
        print('Error fetching posts. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error fetching posts: $error');
    }

    notifyListeners();
  }
}
