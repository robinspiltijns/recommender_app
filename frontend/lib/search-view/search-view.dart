import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:provider/provider.dart';
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
            Column(children: results.map((result) => Text(result)).toList())
          ],
        ));
  }
}
