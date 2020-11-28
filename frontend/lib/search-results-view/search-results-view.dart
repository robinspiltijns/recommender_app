import 'package:flutter/cupertino.dart';
import 'package:frontend/search-results-view/components/search-results-section.dart';
import 'package:swagger/api.dart';

class SearchResultsViewWidget extends StatefulWidget {

  SearchResultsViewWidget({SearchResult searchResult}) {
    this.episodes = searchResult.episoderesults;
    this.podcasts = searchResult.podcastresults;
  }

  List<EpisodeSearchResult> episodes;
  List<PodcastSearchResult> podcasts;

  @override
  _SearchResultsViewWidgetState createState() => _SearchResultsViewWidgetState();
}

class _SearchResultsViewWidgetState extends State<SearchResultsViewWidget> {

  Widget listView;

  SearchResultsSection episodeResultsSection;
  SearchResultsSection podcastResultsSection;

  @override
  void initState() {
    super.initState();
    episodeResultsSection = SearchResultsSection(results: this.widget.episodes, t: ResultType.EPISODES, nbRes: 3, callbackFunction: this.callback,);
    generateListView();
  }

  ListView generateListView() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          height: episodeResultsSection.,
          child: Column(
            children: [
              episodeResultsSection,
              //podcastResultsSecion,
            ],
          ),
        )
      ],
    );
  }

  void callback(SearchResultsSection section, ResultType type) {
    if (type == ResultType.EPISODES) {
      setState(() {
        episodeResultsSection = section;
      });
    } else if (type == ResultType.PODCASTS) {
      setState(() {
        podcastResultsSection = section;
      });
    }
    setState(() {
      listView = generateListView();
    });
    print(episodeResultsSection.nbResults);
  }

  @override
  Widget build(BuildContext context) {
    return generateListView();
  }
}

