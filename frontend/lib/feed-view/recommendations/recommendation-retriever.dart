import 'package:frontend/common/services/played-episodes-service.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/feed-view/recommendations/recommendation-section-data.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:swagger/api.dart' as Swagger;

final api = Swagger.DefaultApi();


Future<List<RecommendationSectionData>> getRecommendations() async {
  List<Episode> listenedEpisodes = await getPlayedEpisodes();
  if(listenedEpisodes.length < 3) {
    List<Genre> selectedGenres = await SelectedGenresService().getSelectedGenres();
    return _getRecommendationsBasedOnGenres(selectedGenres);
  } else {
    return [];
  }
}

Future<List<RecommendationSectionData>> _getRecommendationsBasedOnGenres(List<Genre> genres) async {
  List<Future<Swagger.BestPodcastsResponse>> futureResponses = genres.map((genre) async {
    Swagger.BestPodcastsResponse response = await api.getBestOfGenre(genre.id.toString());
    return response;
  }).toList();
  List<Swagger.BestPodcastsResponse> responses;
  await Future.wait(futureResponses).then((value) => responses = value);
  List<List<Swagger.PodcastSimple>> podcasts = responses.map((response) => response.podcasts).toList();
  List<RecommendationSectionData> result = [];
  for (var index = 0; index < genres.length; index++) {
    result.add(RecommendationSectionData(
        contentType: RecommendationSectionContentType.PODCASTS,
        basisType: RecommendationSectionBasisType.INITIALGENRE,
        basisTitle: genres[index].name,
        episodeRecommendations: [],
        podcastRecommendations: podcasts[index])
    );
  }
  return result;
}