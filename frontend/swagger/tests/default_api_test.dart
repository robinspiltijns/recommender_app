import 'package:swagger/api.dart';
import 'package:test/test.dart';


/// tests for DefaultApi
void main() {
  var instance = new DefaultApi();

  group('tests for DefaultApi', () {
    // Used to get the best podcast from a given genre.
    //
    // Returns a list of podcast shows that belong to the given genre id, ranked by popularity.
    //
    //Future<BestOfGenreResult> getBestOfGenre(String genreId) async
    test('test getBestOfGenre', () async {
      // TODO
    });

    // used to get the details of an episode
    //
    // returns the details of the podcast episode with the given episode id
    //
    //Future<Episode> getEpisode(String id) async
    test('test getEpisode', () async {
      // TODO
    });

    // Fetch recommendations based on an episode.
    //
    // Fetch recommendations based on the given episode id.
    //
    //Future<GetEpisodeRecommendationsResponse> getEpisodeRecommendationsBasedOnEpisode(String xListenAPIKey, String id) async
    test('test getEpisodeRecommendationsBasedOnEpisode', () async {
      // TODO
    });

    // Used to get a list of all podcast genres
    //
    // Returns a list of all podcast genres (this contains their name and id)
    //
    //Future<GetGenresResponse> getGenres() async
    test('test getGenres', () async {
      // TODO
    });

    // Fetch recommendations for a podcast
    //
    // Fetch up to 8 podcast recommendations based on the given podcast id.
    //
    //Future<GetPodcastRecommendationsResponse> getPodcastRecommendationsBasedOnPodcast(String xListenAPIKey, String id) async
    test('test getPodcastRecommendationsBasedOnPodcast', () async {
      // TODO
    });

    // Used to get the search results based on the given search parameters.
    //
    // Returns the search results based on the given search parameters.
    //
    //Future<SearchResult> getSearchResults(String queryString, String searchField) async
    test('test getSearchResults', () async {
      // TODO
    });

    // used to get the details of a show.
    //
    // returns the details of a show.
    //
    //Future<Show> getShow(String id) async
    test('test getShow', () async {
      // TODO
    });

    // Fetch the best podcasts.
    //
    // Returns the best podcasts.
    //
    //Future<BestPodcastsResponse> getTheBestPodcasts(String xListenAPIKey) async
    test('test getTheBestPodcasts', () async {
      // TODO
    });

    // used to test whether the backend is running.
    //
    // returns 'Hello World'
    //
    //Future<String> test() async
    test('test test', () async {
      // TODO
    });

  });
}
