import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/search-view/components/recent-searches.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart' as swagger;
import 'package:frontend/object-model/genre.dart';


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
          setState(() {
            results = result.episoderesults
                .map((episoderesult) => episoderesult.titleOriginal)
                .toList();
          })
        });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SearchFieldWidget(onSubmit: _onSubmit),
            Consumer<PlayerService>(
              builder: (context, playerService, child) {
                return ElevatedButton(
                  onPressed: () {
                    playerService.play("02f0123246c944e289ee2bb90804e41b");
                  },
                  child: Text("start"),
                );
              },
            ),
            RecentSearchesWidget(),
            Column(children: results.map((result) => Text(result)).toList())
          ],
        ));
  }
}
