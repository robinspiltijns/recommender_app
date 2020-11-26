import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:swagger/api.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<String> results = [];
  final api = DefaultApi();

  _onSubmit(String value) {
    Future<SearchResult> futureResult = api.getSearchResults(value, "title");
    futureResult.then((result) => {
          setState(() {
            results = result.episoderesults
                .map((episoderesult) => episoderesult.titleOriginal)
                .toList();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SearchFieldWidget(onSubmit: _onSubmit),
            Column(children: results.map((result) => Text(result)).toList())
          ],
        )
      )
    );
  }
}
