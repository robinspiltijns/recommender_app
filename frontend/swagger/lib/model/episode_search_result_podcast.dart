part of swagger.api;

class EpisodeSearchResultPodcast {
  /* Podcast id. */
  String id = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;

  List<int> genreIds = [];
/* Thumbnail image url for this podcast's artwork (300x300). */
  String thumbnail = null;
/* The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  int listenScore = null;
/* Plain text of podcast name. */
  String titleOriginal = null;
/* The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;
/* Highlighted segment of podcast name. */
  String titleHighlighted = null;
/* Plain text of this podcast's publisher name. */
  String publisherOriginal = null;
/* Highlighted segment of this podcast's publisher name. */
  String publisherHighlighted = null;
/* The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  String listenScoreGlobalRank = null;

  EpisodeSearchResultPodcast();

  @override
  String toString() {
    return 'EpisodeSearchResultPodcast[id=$id, image=$image, genreIds=$genreIds, thumbnail=$thumbnail, listenScore=$listenScore, titleOriginal=$titleOriginal, listennotesUrl=$listennotesUrl, titleHighlighted=$titleHighlighted, publisherOriginal=$publisherOriginal, publisherHighlighted=$publisherHighlighted, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  EpisodeSearchResultPodcast.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    image = json['image'];
    genreIds = (json['genre_ids'] as List).map((item) => item as int).toList();
    thumbnail = json['thumbnail'];
    listenScore = json['listen_score'];
    titleOriginal = json['title_original'];
    listennotesUrl = json['listennotes_url'];
    titleHighlighted = json['title_highlighted'];
    publisherOriginal = json['publisher_original'];
    publisherHighlighted = json['publisher_highlighted'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'genre_ids': genreIds,
      'thumbnail': thumbnail,
      'listen_score': listenScore,
      'title_original': titleOriginal,
      'listennotes_url': listennotesUrl,
      'title_highlighted': titleHighlighted,
      'publisher_original': publisherOriginal,
      'publisher_highlighted': publisherHighlighted,
      'listen_score_global_rank': listenScoreGlobalRank
     };
  }

  static List<EpisodeSearchResultPodcast> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeSearchResultPodcast>() : json.map((value) => new EpisodeSearchResultPodcast.fromJson(value)).toList();
  }

  static Map<String, EpisodeSearchResultPodcast> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeSearchResultPodcast>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeSearchResultPodcast.fromJson(value));
    }
    return map;
  }
}
