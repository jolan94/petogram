import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petogram/data/sample.dart';
import 'package:petogram/models/post.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../viewmodels/add_post_viewmodel.dart';

class AddPostScreen extends StatefulWidget {
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    final addPostViewModel = Provider.of<AddPostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Pick Image'),
            onPressed: () {
              addPostViewModel.pickImage();
            },
          ),
          const SizedBox(height: 20),
          if (addPostViewModel.imageFile != null)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.file(addPostViewModel.imageFile!, fit: BoxFit.cover),
            ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Caption',
            ),
            onChanged: (value) {
              addPostViewModel.setCaption(value);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Share'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Congratulations! Post added successfully')),
              );
              setState(() {
                addPostViewModel.clearPost();
              });
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
