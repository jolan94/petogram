import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/search_viewmodel.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                searchViewModel.search(value);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: searchViewModel.searchResults.isEmpty
                  ? const Text('No results found')
                  : ListView.builder(
                      itemCount: searchViewModel.searchResults.length,
                      itemBuilder: (ctx, index) {
                        final result = searchViewModel.searchResults[index];
                        return ListTile(
                          title: Text(result),
                          // Implement the action when an item is clicked
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
