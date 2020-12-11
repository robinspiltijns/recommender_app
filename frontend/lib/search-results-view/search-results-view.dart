import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:frontend/search-results-view/components/episode-search-result-card.dart';
import 'package:frontend/search-results-view/components/podcast-search-result-card.dart';
import 'package:frontend/search-results-view/components/more-button.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:swagger/api.dart';
import 'package:swagger/api.dart' as swagger;

enum ResultType {
  EPISODES,
  PODCASTS
}

class SearchResultsViewWidget extends StatefulWidget {

  static const String routeName = '/search-results';
  final api = swagger.DefaultApi();


  SearchResult searchResult;
  String queryString;

  static const double TITLE_PART_HEIGHT = 50;
  static const double MORE_PART_HEIGHT = 60;

  SearchResultsViewWidget({@required List<dynamic> arguments}) {
    this.searchResult = arguments[0];
    this.queryString = arguments[1];
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
    if (showingEpisodes.length >= 9) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No more episodes to show",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: FlatButton(
          child: MoreButton(),
          onPressed: () {
            setState(() {
              if ((presentEpisodes + perPage) > this.widget.episodes.length) {
                showingEpisodes.addAll(
                    this.widget.episodes.getRange(
                        presentEpisodes, this.widget.episodes.length));
              } else {
                showingEpisodes.addAll(
                    this.widget.episodes.getRange(
                        presentEpisodes, presentEpisodes + perPage));
              }
              presentEpisodes = presentEpisodes + perPage;
              this.height = height + perPage * EpisodeSearchResultCard.HEIGHT;
            });
          },),
      );
    }
  }

  Widget podcastResults() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return PodcastListItem(Podcast.fromSearchResult(showingPodcasts[index],));
        },
        childCount: this.showingPodcasts.length,
      ),
    );
  }

  Widget moreButtonPodcasts() {
    if (showingPodcasts.length >= 9) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No more podcasts to show",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: FlatButton(
          child: MoreButton(),
          onPressed: () {
            setState(() {
              if ((presentPodcasts + perPage) > this.widget.podcasts.length) {
                showingPodcasts.addAll(
                    this.widget.podcasts.getRange(
                        presentPodcasts, this.widget.podcasts.length));
              } else {
                showingPodcasts.addAll(
                    this.widget.podcasts.getRange(
                        presentPodcasts, presentPodcasts + perPage));
              }
              presentPodcasts = presentPodcasts + perPage;
              this.height = height + perPage * PodcastListItem.HEIGHT;
            });
          },),
      );
    }
  }

  _onSubmit(String value) {
    Future<swagger.SearchResult> futureResult = this.widget.api.getSearchResults(value, "title");
    futureResult.then((result) => {
      Navigator.pushNamed(
          context,
          "/search-results",
          arguments: [result, value])
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: SearchFieldWidget(onSubmit: _onSubmit, query: this.widget.queryString,),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
              child: CustomTextButton("Cancel", color: Colors.white,)
          )
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
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
      ),
    );
  }
}

