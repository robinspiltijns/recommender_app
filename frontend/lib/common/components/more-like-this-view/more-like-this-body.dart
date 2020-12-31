import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/episode-podcast-expandable-lists.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:swagger/api.dart';

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
    setState(() {
      episodeRecommendations = api.getEpisodeRecommendationsBasedOnEpisode(this.widget.episode.id);
    });
    setState(() {
      genreRecommendations = api.getBestOfGenre(this.widget.episode.genres[0].id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<dynamic>>(
      future: Future.wait([genreRecommendations, episodeRecommendations]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Podcast> podcasts;
            BestPodcastsResponse podcastsTemp = snapshot.data[0] as BestPodcastsResponse;
            if (podcastsTemp == null) {
              podcasts = [];
            } else {
              podcasts = podcastsTemp.podcasts.map((pcs) =>
                  Podcast.fromPodcastSimple(pcs)).toList();
            }

            List<Episode> episodes;
            GetEpisodeRecommendationsResponse episodesTemp = snapshot.data[1] as GetEpisodeRecommendationsResponse;
            if (episodesTemp == null) {
              episodes = [];
            } else {
              episodes = episodesTemp.recommendations.map((et) => Episode.fromEpisodeSimple(et)).toList();
            }
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
