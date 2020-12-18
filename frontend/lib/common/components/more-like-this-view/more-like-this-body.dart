import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/episode-podcast-expandable-lists.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';
import '../episode-list-item.dart';

class MoreLikeThisBody extends StatelessWidget {

  final api = DefaultApi();

  static final MAX_NB_RESULTS = 200;

  Episode episode;
  Future<List<dynamic>> resultItems;
  Future<BestPodcastsResponse> genreRecommendations;
  Future<GetEpisodeRecommendationsResponse> episodeRecommendations;


  MoreLikeThisBody(episode) {
    initializeEpisode(episode);
  }

  initializeEpisode(ep) async {
    await epi(ep);
    setResultItems();
  }

  epi(ep) {
    episode = Episode.fromEpisodeFull(ep);
  }

  setResultItems() async {
    print("komt hier-----------------------------");
    //Future<GetEpisodeRecommendationsResponse> episodeRecommendations = api.getEpisodeRecommendationsBasedOnEpisode(episode.id);
    episodeRecommendations = api.getEpisodeRecommendationsBasedOnEpisode(episode.id);
    print("doet episode recommendations -------------------");
    //Future<BestPodcastsResponse> genreRecommendations = api.getBestOfGenre(episode.genres[0].id.toString());
    genreRecommendations = api.getBestOfGenre(episode.genres[0].id.toString());
    print("doet genre recommendations -----------------------");
    //resultItems = Future.wait([episodeRecommendations, genreRecommendations]);
    print("futures zijn gemaakt -----------------------------");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<Object>>(
        future: Future.wait([episodeRecommendations, genreRecommendations]),
        builder: (context, snapshot) {
          print("zit in builder ----------------------------");
          if (snapshot.hasData) {
            print("ZIT IN HASDATA ------------------------");
            BestPodcastsResponse podcastResults = snapshot.data[1] as BestPodcastsResponse;
            List<Podcast> podcasts = podcastResults.podcasts.map((podcast) => Podcast.fromPodcastSimple(podcast)).toList();
            GetEpisodeRecommendationsResponse episodeResults = snapshot.data[0] as GetEpisodeRecommendationsResponse;
            List<Episode> episodes = episodeResults.recommendations.map((e) => Episode.fromEpisodeSimple(e)).toList();
            return EpisodePodcastExpandableLists(podcasts, episodes);
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Text("loading...");
        }
      );
  }
}
