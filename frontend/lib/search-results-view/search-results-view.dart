import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/search-results-view/components/episode-search-result-card.dart';
import 'package:frontend/search-results-view/components/more-button.dart';
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

  @override
  void initState() {
    super.initState();
    setState(() {
      showingEpisodes.addAll(this.widget.episodes.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  List<EpisodeSearchResult> showingEpisodes = [];

  int perPage  = 3;
  int present = 0;

  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SearchResultsSection.TITLE_PART_HEIGT,
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Text(
            titles[ResultType.EPISODES],
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Flexible(
          child: new ListView.builder(
            itemCount: (present <= this.widget.episodes.length) ? showingEpisodes.length + 1 : showingEpisodes.length,
            itemBuilder: (context, index) {
              return (index == showingEpisodes.length ) ?
                Container(
                  height: SearchResultsSection.MORE_PART_HEIGT,
                  child: FlatButton(
                    child: MoreButton(),
                    onPressed: () {
                      setState(() {
                        if((present + perPage)> this.widget.episodes.length) {
                          showingEpisodes.addAll(
                              this.widget.episodes.getRange(present, this.widget.episodes.length));
                        } else {
                          showingEpisodes.addAll(
                              this.widget.episodes.getRange(present, present + perPage));
                        }
                        present = present + perPage;
                    });
                  },),
                )
              :
              EpisodeSearchResultCard(
                ep: this.showingEpisodes[index]);
            },
          ),
        ),
      ],
    );
  }
}

