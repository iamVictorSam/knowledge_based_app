import 'package:flutter/material.dart';
import 'package:knowledge_based_app/custom_card.dart';

class SearchScreen extends SearchDelegate {
  final List data;

  SearchScreen({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<dynamic> matchQuery = [];

    for (var item in data) {
      var value = item['fields']['howto_title'].toString().toLowerCase();

      if (value.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index]['fields'];

        String dateString = data[index]['updated'];

        DateTime date = DateTime.parse(dateString);

        return CustomCard(
          resp: result,
          question: result['howto_title'],
          date: date,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<dynamic> matchQuery = [];

    for (var item in data) {
      var value = item['fields']['howto_title'].toString().toLowerCase();

      if (value.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index]['fields'];

        String dateString = data[index]['updated'];
        DateTime date = DateTime.parse(dateString);

        return CustomCard(
          resp: result,
          question: result['howto_title'],
          date: date,
        );
      },
    );
  }
}
