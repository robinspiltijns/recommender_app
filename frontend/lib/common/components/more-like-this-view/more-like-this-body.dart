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

class MoreLikeThisBody extends StatefulWidget {

  static final MAX_NB_RESULTS = 200;

  Episode episode;

  MoreLikeThisBody(episode) {
    initializeEpisode(episode);
  }


  initializeEpisode(ep) async {
    await epi(ep);
  }

  epi(ep) {
    episode = Episode.fromEpisodeFull(ep);
  }


  @override
  _MoreLikeThisBodyState createState() => _MoreLikeThisBodyState();
}

class _MoreLikeThisBodyState extends State<MoreLikeThisBody> {
  final api = DefaultApi();

  @override
  initState() {
    super.initState();
    setResultItems();
  }


  Future<List<dynamic>> resultItems;

  Future<BestPodcastsResponse> genreRecommendations;

  Future<GetEpisodeRecommendationsResponse> episodeRecommendations;



  setResultItems() async {
    print("komt hier-----------------------------");
    //Future<GetEpisodeRecommendationsResponse> episodeRecommendations = api.getEpisodeRecommendationsBasedOnEpisode(episode.id);
    setState(() {
      episodeRecommendations = api.getEpisodeRecommendationsBasedOnEpisode(this.widget.episode.id);
    });
    print("doet episode recommendations -------------------");
    //Future<BestPodcastsResponse> genreRecommendations = api.getBestOfGenre(episode.genres[0].id.toString());
    setState(() {
      genreRecommendations = api.getBestOfGenre(this.widget.episode.genres[0].id.toString());
    });
    print("doet genre recommendations -----------------------");
    //resultItems = Future.wait([episodeRecommendations, genreRecommendations]);
    print("futures zijn gemaakt -----------------------------");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<dynamic>>(
      future: Future.wait([genreRecommendations, episodeRecommendations]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BestPodcastsResponse podcastsTemp = snapshot.data[0] as BestPodcastsResponse;
            List<Podcast> podcasts = podcastsTemp.podcasts.map((pcs) => Podcast.fromPodcastSimple(pcs)).toList();

            GetEpisodeRecommendationsResponse episodesTemp = snapshot.data[1] as GetEpisodeRecommendationsResponse;
            List<Episode> episodes = episodesTemp.recommendations.map((et) => Episode.fromEpisodeSimple(et)).toList();
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
