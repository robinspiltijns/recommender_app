import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/search-results-view/components/episode-search-result-card.dart';
import 'package:frontend/search-results-view/components/podcast-search-result-card.dart';
import 'package:frontend/search-results-view/components/more-button.dart';
import 'package:swagger/api.dart';

enum ResultType {
  EPISODES,
  PODCASTS
}

class SearchResultsViewWidget extends StatefulWidget {

  static const double TITLE_PART_HEIGHT = 50;
  static const double MORE_PART_HEIGHT = 60;

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
      showingEpisodes.addAll(this.widget.episodes.getRange(presentEpisodes, presentEpisodes + perPage));
      presentEpisodes = presentEpisodes + perPage;
      showingPodcasts.addAll(this.widget.podcasts.getRange(presentPodcasts, presentPodcasts + perPage));
      presentPodcasts = presentPodcasts + perPage;
      this.height = 1000;
    });
  }

  List<EpisodeSearchResult> showingEpisodes = [];
  List<PodcastSearchResult> showingPodcasts = [];
  double height;

  int perPage  = 3;
  int presentEpisodes = 0;
  int presentPodcasts = 0;

  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };

  Widget episodeResults() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return EpisodeSearchResultCard(ep: showingEpisodes[index],);
          },
        childCount: this.showingEpisodes.length,
      ),
    );
  }

  Widget moreButtonEpisodes() {
    return SliverToBoxAdapter(
      child: FlatButton(
        child: MoreButton(),
        onPressed: () {
          setState(() {
            if((presentEpisodes + perPage)> this.widget.episodes.length) {
              showingEpisodes.addAll(
                  this.widget.episodes.getRange(presentEpisodes, this.widget.episodes.length));
            } else {
              showingEpisodes.addAll(
                  this.widget.episodes.getRange(presentEpisodes, presentEpisodes + perPage));
            }
            presentEpisodes = presentEpisodes + perPage;
            this.height = height + perPage*EpisodeSearchResultCard.HEIGHT;
          });
        },),
    );
  }

  Widget podcastResults() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return PodcastSearchResultCard(showingPodcasts[index],);
        },
        childCount: this.showingPodcasts.length,
      ),
    );
  }

  Widget moreButtonPodcasts() {
    return SliverToBoxAdapter(
      child: FlatButton(
        child: MoreButton(),
        onPressed: () {
          setState(() {
            if((presentPodcasts + perPage)> this.widget.podcasts.length) {
              showingPodcasts.addAll(
                  this.widget.podcasts.getRange(presentPodcasts, this.widget.podcasts.length));
            } else {
              showingPodcasts.addAll(
                  this.widget.podcasts.getRange(presentPodcasts, presentPodcasts + perPage));
            }
            presentPodcasts = presentPodcasts + perPage;
            this.height = height + perPage*PodcastSearchResultCard.HEIGHT;
          });
        },),
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 20),
            child: Text(
              titles[ResultType.EPISODES], 
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        episodeResults(),
        moreButtonEpisodes(),
        SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 20),
            child: Text(
              titles[ResultType.PODCASTS],
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        podcastResults(),
        moreButtonPodcasts(),
      ],
    );
  }
}

