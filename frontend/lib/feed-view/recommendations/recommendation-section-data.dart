import 'package:frontend/object-model/episode.dart';
import 'package:swagger/api.dart';

enum RecommendationSectionContentType { PODCASTS, EPISODES }
enum RecommendationSectionBasisType {
  FREQUENTGENRES,
  LASTPLAYEDEPISODES,
  LASTPLAYEDPODCASTS,
  POPULAR,
  LIKED,
  INITIALGENRE
}

class RecommendationSectionData {
  final RecommendationSectionContentType contentType;
  final RecommendationSectionBasisType basisType;
  final String basisTitle;
  final List<EpisodeSimple> episodeRecommendations;
  final List<PodcastSimple> podcastRecommendations;

  RecommendationSectionData(
      {this.contentType,
      this.basisType,
      this.basisTitle,
      this.episodeRecommendations,
      this.podcastRecommendations});
}
