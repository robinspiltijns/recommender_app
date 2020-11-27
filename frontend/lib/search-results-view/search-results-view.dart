import 'package:flutter/cupertino.dart';
import 'package:frontend/search-results-view/components/search-results-section.dart';
import 'package:swagger/api.dart';

class SearchResultsViewWidget extends StatelessWidget {

  SearchResultsViewWidget({SearchResult searchResult}) {
    this.episodes = searchResult.episoderesults;
    this.podcasts = searchResult.podcastresults;
  }

  List<EpisodeSearchResult> episodes;
  List<PodcastSearchResult> podcasts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SearchResultsSection(results: this.episodes, t: ResultType.EPISODES,),
              //SearchResultsSection(results: this.podcasts, t: ResultType.PODCASTS,)
            ],
          ),
        )
      ],
    );
  }
}

