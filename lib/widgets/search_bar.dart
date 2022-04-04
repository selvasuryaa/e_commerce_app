import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext ctx) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext ctx) {
    return IconButton(
      onPressed: () {
        Navigator.of(ctx).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext ctx) {
   return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext ctx) {
   return Text("");
  }
}
