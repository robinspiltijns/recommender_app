import 'package:flutter/cupertino.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:frontend/search-results-view/search-results-view.dart';
import 'package:swagger/api.dart';

class SearchResultsViewTestLayer extends StatefulWidget {

  @override
  _SearchResultsViewTestLayerState createState() => _SearchResultsViewTestLayerState();
}

class _SearchResultsViewTestLayerState extends State<SearchResultsViewTestLayer> {
  final api = DefaultApi();

  Future<GetPodcastRecommendationsResponse> futureResp;

  List<Map<String, dynamic>> sections = [
    {"name" : "Star Wars"},
  ];

  @override
  void initState() {
    super.initState();
    makeFutures();
  }

  List<Future<Map<String, dynamic>>> futures;

  makeFutures() async {
    List<Map<String, dynamic>> result;
    for (var index = 0; index <sections.length; index++) {
      await AddSection(index);
    };
  }

  AddSection(int entryIndex) async {
    sections[entryIndex]["searchResult"] = api.getSearchResults("star wars", "title");
  }

  List<Widget> generateSections() {
    List<Widget> result = [];
    for (var section in sections) {
      result.add(FutureBuilder<SearchResult>(
          future: section["searchResult"],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var res = snapshot.data;
              return SearchResultsViewWidget(searchResult: res,);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Text("test...");
          }
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: generateSections()[0],
    );
  }
}