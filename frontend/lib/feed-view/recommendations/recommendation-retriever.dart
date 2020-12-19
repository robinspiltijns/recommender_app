import 'package:frontend/common/services/played-episodes-service.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/feed-view/recommendations/recommendation-section-data.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:swagger/api.dart' as Swagger;
import "dart:math";

final api = Swagger.DefaultApi();
final _random = new Random();

Future<List<RecommendationSectionData>> getRecommendations() async {
  List<Episode> listenedEpisodes = await getPlayedEpisodes();
  if (listenedEpisodes.length < 3) {
    List<Genre> selectedGenres =
        await SelectedGenresService().getSelectedGenres();
    return _getRecommendationsBasedOnGenres(selectedGenres, RecommendationSectionBasisType.INITIALGENRE);
  } else {
    print("in else");
    List<Genre> mostFrequentGenres = _getMostFrequentGenres(listenedEpisodes);
    print(
        "Most frequent genres: ");
    mostFrequentGenres.forEach((element) {
      print(element.name + ": " + element.id.toString());
    });
    var genre = mostFrequentGenres[_random.nextInt(mostFrequentGenres.length)];
    return _getRecommendationsBasedOnGenres([genre], RecommendationSectionBasisType.FREQUENTGENRES);
  }
}

Future<List<RecommendationSectionData>> _getRecommendationsBasedOnGenres(
    List<Genre> genres, RecommendationSectionBasisType basis) async {
  List<Future<Swagger.BestPodcastsResponse>> futureResponses =
      genres.map((genre) async {
    Swagger.BestPodcastsResponse response =
        await api.getBestOfGenre(genre.id.toString());
    return response;
  }).toList();
  List<Swagger.BestPodcastsResponse> responses;
  await Future.wait(futureResponses).then((value) => responses = value);
  List<List<Swagger.PodcastSimple>> podcasts =
      responses.map((response) => response.podcasts).toList();
  List<RecommendationSectionData> result = [];
  for (var index = 0; index < genres.length; index++) {
    result.add(RecommendationSectionData(
        contentType: RecommendationSectionContentType.PODCASTS,
        basisType: basis,
        basisTitle: genres[index].name,
        episodeRecommendations: [],
        podcastRecommendations: podcasts[index]));
  }
  return result;
}

List<Genre> _getMostFrequentGenres(List<Episode> episodes) {
  List<Episode> relevantEpisodes;
  if (episodes.length < 10) {
    relevantEpisodes = episodes;
  } else {
    relevantEpisodes = episodes.sublist(0, 10);
  }
  var genres = relevantEpisodes
      .expand((episode) => episode.genres)
      .where((genre) => genre.id != 67)
      .toList();
  Map<int, int> genreOccurrences = Map();
  genres.forEach((genre) {
    int id = genre.id;
    if (genreOccurrences.containsKey(id)) {
      genreOccurrences[id] += 1;
    } else {
      genreOccurrences[id] = 1;
    }
  });
  print("occurences" + genreOccurrences.toString());
  genres.sort((a, b) => (genreOccurrences[a.id]).compareTo(genreOccurrences[b.id]));
  return genres.sublist(0, 3);
}
