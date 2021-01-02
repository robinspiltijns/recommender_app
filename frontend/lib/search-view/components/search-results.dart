import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/common/components/episode-podcast-expandable-lists.dart';
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



  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchResult,
      builder: (context, AsyncSnapshot<swagger.SearchResult> snapshot) {
        if (snapshot.hasData) {
          List<Podcast> podcasts = snapshot.data.podcastresults.map((pc) => Podcast.fromSearchResult(pc)).toList();
          List<Episode> episodes = snapshot.data.episoderesults.map((e) => Episode.fromEpisodeSearchResult(e)).toList();
          return EpisodePodcastExpandableLists(podcasts, episodes);
        }
        return CircularProgressIndicator();
      }
    );
  }
}

