import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/search-view/components/recent-searches.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:swagger/api.dart' as swagger;
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/object-model/episode.dart';


class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // mock data
  List<Genre> genres = [
    new Genre(67, "Finance"),
    new Genre(12, "Health"),
    new Genre(33, "Technology"),
    new Genre(56, "News"),
  ];

  List<String> results = [];
  final api = swagger.DefaultApi();

  _onSubmit(String value) {
    Future<swagger.SearchResult> futureResult = api.getSearchResults(value, "title");
    futureResult.then((result) => {
          Navigator.pushNamed(
          context,
          "/search-results",
          arguments: result)
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
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            SearchFieldWidget(onSubmit: _onSubmit),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  RecentSearchesWidget(),
                  SizedBox(height: 20),
                  GenresWidget("Browse genres", genres),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
