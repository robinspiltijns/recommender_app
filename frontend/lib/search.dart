import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<String> results = ['Result 1', 'Result 2', 'Result 3'];
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
            TextField(
              onSubmitted: _onSubmit,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
                hintText: 'Title, description, genre, ...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 14.0, right: 14.0),
              ),
            ),
            Column(children: results.map((result) => Text(result)).toList())
          ],
        ));
  }
}
