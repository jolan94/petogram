import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petogram/data/sample.dart';
import 'package:petogram/models/post.dart';
import 'package:uuid/uuid.dart';

class AddPostViewModel extends ChangeNotifier {
  String _caption = '';
  File? _imageFile;

  String get caption => _caption;
  File? get imageFile => _imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  void setCaption(String caption) {
    _caption = caption;
  }

  bool validatePost(BuildContext context) {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return false;
    }

    if (_caption.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a caption')),
      );
      return false;
    }

    return true;
  }

  void clearPost() async {
    _caption = "";
    _imageFile = null;
  }

  void addPost() async {
    final appDir = await getApplicationDocumentsDirectory();
    final postId = const Uuid().v4();
    final imagePath = '${appDir.path}/$postId.jpg';
    final File newImage = await _imageFile!.copy(imagePath);

    final post = Post(
      imageUrl: imagePath,
      caption: _caption,
      likeCount: 0,
    );
    dummyPosts.add(post); // Replace with your implementation
  }
}
