import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/common/services/played-episodes-service.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/feed-view/recommendations/recommendation-section-data.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:swagger/api.dart' as Swagger;
import "dart:math";

final api = Swagger.DefaultApi();
final _random = new Random();

Future<List<RecommendationSectionData>> getRecommendations() async {
  // Could be waited but database load time is ignoreable.
  List<Episode> listenedEpisodes = await getPlayedEpisodes();
  // Kinda dangerous, but the selected genre service isn't required for this query. It should be removed from the liked service.
  List<Episode> likedEpisodes =
      await LikedEpisodesService(DatabaseHelper().initializedDatabase, null)
          .getLikedEpisodes();

  print("got liked episodes");

  if (listenedEpisodes.length < 3) {
    List<Genre> selectedGenres =
        await SelectedGenresService().getSelectedGenres();
    List<Future<RecommendationSectionData>> futureRecommendationSections =
        selectedGenres
            .map((genre) => _getRecommendationsBasedOnGenre(
                genre, RecommendationSectionBasisType.INITIALGENRE))
            .toList();
    return await Future.wait(futureRecommendationSections);
  } else {
    // Initialize future result
    List<Future<RecommendationSectionData>> futureResult = [];
    // Add recommendations based on frequent genres
    List<Genre> mostFrequentGenres = _getMostFrequentGenres(listenedEpisodes);
    Genre genre =
        mostFrequentGenres[_random.nextInt(mostFrequentGenres.length)];
    futureResult.add(_getRecommendationsBasedOnGenre(
        genre, RecommendationSectionBasisType.FREQUENTGENRES));
    // Add recommendations based on popularity
    futureResult.add(_getRecommendationsBasedOnPopularity());
    // Add recommendations based on recently played episodes
    futureResult.add(_getRecommendationsBasedOnEpisode(
        listenedEpisodes[_random.nextInt(3)],
        RecommendationSectionBasisType.LASTPLAYEDEPISODES));
    // Add recommendations based on recently played podcasts
    String podcastId = listenedEpisodes[_random.nextInt(3)].podcastId;
    Swagger.PodcastFull podcast = await api.getPodcast(podcastId);
    futureResult.add(_getRecommendationsBasedOnPodcast(
        listenedEpisodes[_random.nextInt(3)].podcastId));
    // Add recommendations based on recently liked podcasts
    if (likedEpisodes.length > 0) {
      futureResult.add(_getRecommendationsBasedOnEpisode(
          listenedEpisodes[_random.nextInt(min(likedEpisodes.length, 3))],
          RecommendationSectionBasisType.LIKED));
    }
    // Shuffle and return the result.
    futureResult.shuffle();
    print("awaiting recommendations...");
    return await Future.wait(futureResult);
  }
}

Future<RecommendationSectionData> _getRecommendationsBasedOnGenre(
    Genre genre, RecommendationSectionBasisType basis) async {
  Swagger.BestPodcastsResponse response =
      await api.getBestOfGenre(genre.id.toString());
  return RecommendationSectionData(
      contentType: RecommendationSectionContentType.PODCASTS,
      basisType: basis,
      basisTitle: genre.name,
      episodeRecommendations: [],
      podcastRecommendations: response.podcasts);
}

Future<RecommendationSectionData> _getRecommendationsBasedOnPopularity() async {
  List<Swagger.PodcastSimple> popularPodcasts;
  await api
      .getTheBestPodcasts()
      .then((response) => popularPodcasts = response.podcasts);
  return RecommendationSectionData(
      contentType: RecommendationSectionContentType.PODCASTS,
      basisType: RecommendationSectionBasisType.POPULAR,
      basisTitle: "popular",
      episodeRecommendations: [],
      podcastRecommendations: popularPodcasts);
}

Future<RecommendationSectionData> _getRecommendationsBasedOnEpisode(
    Episode episode, RecommendationSectionBasisType basis) async {
  Swagger.GetEpisodeRecommendationsResponse response =
      await api.getEpisodeRecommendationsBasedOnEpisode(episode.id);
  return RecommendationSectionData(
      contentType: RecommendationSectionContentType.EPISODES,
      basisType: basis,
      basisTitle: episode.title,
      episodeRecommendations: response.recommendations,
      podcastRecommendations: []);
}

Future<RecommendationSectionData> _getRecommendationsBasedOnPodcast(
    String podcastId) async {
  Future<Swagger.PodcastFull> futurePodcast = api.getPodcast(podcastId);
  Future<Swagger.GetPodcastRecommendationsResponse> futureResponse =
      api.getPodcastRecommendationsBasedOnPodcast(podcastId);
  Swagger.PodcastFull podcast;
  Swagger.GetPodcastRecommendationsResponse response;
  await Future.wait([futurePodcast, futureResponse]).then((res) {
    podcast = res[0];
    response = res[1];
  });
  return RecommendationSectionData(
      contentType: RecommendationSectionContentType.PODCASTS,
      basisType: RecommendationSectionBasisType.LASTPLAYEDEPISODES,
      basisTitle: podcast.title,
      episodeRecommendations: [],
      podcastRecommendations: response.recommendations);
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
  genres.sort(
      (a, b) => (genreOccurrences[a.id]).compareTo(genreOccurrences[b.id]));
  return genres.sublist(0, 3);
}
