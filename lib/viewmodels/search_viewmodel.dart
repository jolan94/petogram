import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  List<String> searchResults = [];

  void search(String query) {
    // Implement your search logic here
    // This is just a basic example
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      searchResults = ['Result 1', 'Result 2', 'Result 3']
          .where((result) => result.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
