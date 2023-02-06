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
      var value = item['question'].toString().toLowerCase();

      if (value.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        String dateString = result['answered_on'];
        DateTime date = DateTime.parse(dateString);

        return CustomCard(
          resp: result,
          answeredBy: result['answered_by'],
          question: result['question'],
          date: date,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<dynamic> matchQuery = [];

    for (var item in data) {
      var value = item['question'].toString().toLowerCase();

      if (value.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        String dateString = result['answered_on'];
        DateTime date = DateTime.parse(dateString);

        return CustomCard(
          resp: result,
          answeredBy: result['answered_by'],
          question: result['question'],
          date: date,
        );
      },
    );
  }
}
