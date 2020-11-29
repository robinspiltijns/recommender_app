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

  double episodeSectionHeight;
  double podcastSectionHeight;

  @override
  void initState() {
    super.initState();
    generateNewEpisodeResultsSection();
    generateListView();
  }

  generateNewEpisodeResultsSection() async {
    episodeResultsSection = SearchResultsSection(results: this.widget.episodes, t: ResultType.EPISODES, nbRes: 3, callbackFunction: this.callback, setHeightFunction: this.setHeight,);
  }

  ListView generateListView() {
    print("height: " + episodeSectionHeight.toString());
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          height: this.episodeSectionHeight,
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

  void setHeight(ResultType type, double height) {
    if (type == ResultType.EPISODES) {
      this.episodeSectionHeight = height;
    } else if (type == ResultType.PODCASTS) {
      this.podcastSectionHeight = height;
    }
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

