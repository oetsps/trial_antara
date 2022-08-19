import 'package:flutter/material.dart';



class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Terkini',
    'La Liga',
    'UCL',
    'MottoGP',
    'VNL',
    'EPL',
    'Barcelona',
    'Arsenal'
  ];
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchItem in searchTerms) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchItem in searchTerms) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}