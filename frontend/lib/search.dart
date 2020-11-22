import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {


  List<String> results = [];
  final searchController = TextEditingController();
  final api = DefaultApi();

  _onSubmit(String value) {
    Future<SearchResult> futureResult = api.getSearchResults(value, "title");
  //  futureResult.then((result) => {
  //    print(result.episoderesults)
   // });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: _onSubmit);
  }

}