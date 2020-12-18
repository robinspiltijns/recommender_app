import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:frontend/common//components/episode-list-item.dart';
import 'package:frontend/common//components/podcast-list-item.dart';
import 'package:frontend/search-view/components/more-button.dart';
import 'package:swagger/api.dart' as swagger;

enum ResultType {
  EPISODES,
  PODCASTS
}

class SearchResults extends StatefulWidget {
  final String queryString;

  SearchResults(this.queryString);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  final api = swagger.DefaultApi();

  @override
  void initState() {
    super.initState();
    setState(() {
        searchResult = api.getSearchResults(widget.queryString, "title");
      }
    );
  }


  Future<swagger.SearchResult> searchResult;

  int perPage  = 3;
  int presentEpisodes = 3;
  int presentPodcasts = 3;



  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };

  Widget episodeResults(List<swagger.EpisodeSearchResult> episodeResults) {
    if (episodeResults.length == 0) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No episode search results found.",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return EpisodeListItem(
              Episode.fromEpisodeSearchResult(episodeResults[index])
          );
        },
        childCount: this.presentEpisodes,
      ),
    );
  }

  Widget moreButtonEpisodes(List<swagger.EpisodeSearchResult> episodeResults) {
    if (episodeResults.length == 0) {
      return SliverToBoxAdapter(
          child: Container()
      );
    }
    if (presentEpisodes >= 9 || presentEpisodes >= episodeResults.length) {
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
                presentEpisodes = min(presentEpisodes + perPage, episodeResults.length);
            });
          },),
      );
    }
  }

  Widget podcastResults(List<swagger.PodcastSearchResult> podcastResults) {
      if (podcastResults.length == 0) {
        return SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              "No podcast search results found.",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
        );
      }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return PodcastListItem(Podcast.fromSearchResult(podcastResults[index],));
        },
        childCount: min(this.presentPodcasts, podcastResults.length),
      ),
    );
  }

  Widget moreButtonPodcasts(List<swagger.PodcastSearchResult> podcastResults) {
    if (podcastResults.length == 0) {
      return SliverToBoxAdapter(
          child: Container()
      );
    }
    if (presentPodcasts >= 9 || presentPodcasts >= podcastResults.length) {
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
              presentPodcasts = min(presentPodcasts + perPage, podcastResults.length);
            });
          },),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchResult,
      builder: (context, AsyncSnapshot<swagger.SearchResult> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
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
                episodeResults(snapshot.data.episoderesults),
                moreButtonEpisodes(snapshot.data.episoderesults),
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
                podcastResults(snapshot.data.podcastresults),
                moreButtonPodcasts(snapshot.data.podcastresults),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      }
    );
  }
}

