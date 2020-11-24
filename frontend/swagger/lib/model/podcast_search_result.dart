part of swagger.api;

class PodcastSearchResult {
  /* Podcast id. */
  String id = null;
/* RSS url of this podcast. This field is available only in the PRO plan. */
  String rss = null;
/* The email of this podcast's producer. This field is available only in the PRO plan. */
  String email = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;
/* Website url of this podcast. */
  String website = null;

  List<int> genreIds = [];
/* iTunes id for this podcast. */
  int itunesId = null;
/* Thumbnail image url for this podcast's artwork (300x300). */
  String thumbnail = null;
/* The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  int listenScore = null;
/* Plain text of podcast name. */
  String titleOriginal = null;
/* Total number of episodes in this podcast. */
  int totalEpisodes = null;
/* The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;
/* Whether this podcast contains explicit language. */
  bool explicitContent = null;
/* Highlighted segment of podcast name. */
  String titleHighlighted = null;
/* The published date of the latest episode of this podcast. In milliseconds */
  int latestPubDateMs = null;
/* Plain text of this podcast's publisher name. */
  String publisherOriginal = null;
/* Plain text of podcast description */
  String descriptionOriginal = null;
/* The published date of the oldest episode of this podcast. In milliseconds */
  int earliestPubDateMs = null;
/* Highlighted segment of this podcast's publisher name. */
  String publisherHighlighted = null;
/* Highlighted segment of podcast description */
  String descriptionHighlighted = null;
/* The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  String listenScoreGlobalRank = null;

  PodcastSearchResult();

  @override
  String toString() {
    return 'PodcastSearchResult[id=$id, rss=$rss, email=$email, image=$image, website=$website, genreIds=$genreIds, itunesId=$itunesId, thumbnail=$thumbnail, listenScore=$listenScore, titleOriginal=$titleOriginal, totalEpisodes=$totalEpisodes, listennotesUrl=$listennotesUrl, explicitContent=$explicitContent, titleHighlighted=$titleHighlighted, latestPubDateMs=$latestPubDateMs, publisherOriginal=$publisherOriginal, descriptionOriginal=$descriptionOriginal, earliestPubDateMs=$earliestPubDateMs, publisherHighlighted=$publisherHighlighted, descriptionHighlighted=$descriptionHighlighted, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  PodcastSearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    rss = json['rss'];
    email = json['email'];
    image = json['image'];
    website = json['website'];
    genreIds = (json['genre_ids'] as List).map((item) => item as int).toList();
    itunesId = json['itunes_id'];
    thumbnail = json['thumbnail'];
    listenScore = json['listen_score'];
    titleOriginal = json['title_original'];
    totalEpisodes = json['total_episodes'];
    listennotesUrl = json['listennotes_url'];
    explicitContent = json['explicit_content'];
    titleHighlighted = json['title_highlighted'];
    latestPubDateMs = json['latest_pub_date_ms'];
    publisherOriginal = json['publisher_original'];
    descriptionOriginal = json['description_original'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    publisherHighlighted = json['publisher_highlighted'];
    descriptionHighlighted = json['description_highlighted'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rss': rss,
      'email': email,
      'image': image,
      'website': website,
      'genre_ids': genreIds,
      'itunes_id': itunesId,
      'thumbnail': thumbnail,
      'listen_score': listenScore,
      'title_original': titleOriginal,
      'total_episodes': totalEpisodes,
      'listennotes_url': listennotesUrl,
      'explicit_content': explicitContent,
      'title_highlighted': titleHighlighted,
      'latest_pub_date_ms': latestPubDateMs,
      'publisher_original': publisherOriginal,
      'description_original': descriptionOriginal,
      'earliest_pub_date_ms': earliestPubDateMs,
      'publisher_highlighted': publisherHighlighted,
      'description_highlighted': descriptionHighlighted,
      'listen_score_global_rank': listenScoreGlobalRank
     };
  }

  static List<PodcastSearchResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastSearchResult>() : json.map((value) => new PodcastSearchResult.fromJson(value)).toList();
  }

  static Map<String, PodcastSearchResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastSearchResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastSearchResult.fromJson(value));
    }
    return map;
  }
}
