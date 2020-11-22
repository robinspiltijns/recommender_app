part of swagger.api;

class PodcastSearchResult {
  
  RssField rss = null;
/* Highlighted segment of podcast description */
  String descriptionHighlighted = null;
/* Plain text of podcast description */
  String descriptionOriginal = null;

  PodcastTitleHighlightedField titleHighlighted = null;

  PodcastTitleOriginalField titleOriginal = null;

  PublisherHighlightedField publisherHighlighted = null;

  PublisherOriginalField publisherOriginal = null;

  ImageField image = null;

  ThumbnailField thumbnail = null;

  ITunesIdField itunesId = null;

  LatestPubDateMsField latestPubDateMs = null;

  EarliestPubDateMsField earliestPubDateMs = null;

  PodcastIdField id = null;

  GenreIdsField genreIds = null;

  PodcastLNUrlField listennotesUrl = null;

  TotalEpisodesField totalEpisodes = null;

  EmailField email = null;

  ExplicitField explicitContent = null;

  WebsiteField website = null;

  ListenScoreField listenScore = null;

  ListenScoreGlobalRankField listenScoreGlobalRank = null;

  PodcastSearchResult();

  @override
  String toString() {
    return 'PodcastSearchResult[rss=$rss, descriptionHighlighted=$descriptionHighlighted, descriptionOriginal=$descriptionOriginal, titleHighlighted=$titleHighlighted, titleOriginal=$titleOriginal, publisherHighlighted=$publisherHighlighted, publisherOriginal=$publisherOriginal, image=$image, thumbnail=$thumbnail, itunesId=$itunesId, latestPubDateMs=$latestPubDateMs, earliestPubDateMs=$earliestPubDateMs, id=$id, genreIds=$genreIds, listennotesUrl=$listennotesUrl, totalEpisodes=$totalEpisodes, email=$email, explicitContent=$explicitContent, website=$website, listenScore=$listenScore, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  PodcastSearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    rss = new RssField.fromJson(json['rss']);
    descriptionHighlighted = json['description_highlighted'];
    descriptionOriginal = json['description_original'];
    titleHighlighted = new PodcastTitleHighlightedField.fromJson(json['title_highlighted']);
    titleOriginal = new PodcastTitleOriginalField.fromJson(json['title_original']);
    publisherHighlighted = new PublisherHighlightedField.fromJson(json['publisher_highlighted']);
    publisherOriginal = new PublisherOriginalField.fromJson(json['publisher_original']);
    image = new ImageField.fromJson(json['image']);
    thumbnail = new ThumbnailField.fromJson(json['thumbnail']);
    itunesId = new ITunesIdField.fromJson(json['itunes_id']);
    latestPubDateMs = new LatestPubDateMsField.fromJson(json['latest_pub_date_ms']);
    earliestPubDateMs = new EarliestPubDateMsField.fromJson(json['earliest_pub_date_ms']);
    id = new PodcastIdField.fromJson(json['id']);
    genreIds = new GenreIdsField.fromJson(json['genre_ids']);
    listennotesUrl = new PodcastLNUrlField.fromJson(json['listennotes_url']);
    totalEpisodes = new TotalEpisodesField.fromJson(json['total_episodes']);
    email = new EmailField.fromJson(json['email']);
    explicitContent = new ExplicitField.fromJson(json['explicit_content']);
    website = new WebsiteField.fromJson(json['website']);
    listenScore = new ListenScoreField.fromJson(json['listen_score']);
    listenScoreGlobalRank = new ListenScoreGlobalRankField.fromJson(json['listen_score_global_rank']);
  }

  Map<String, dynamic> toJson() {
    return {
      'rss': rss,
      'description_highlighted': descriptionHighlighted,
      'description_original': descriptionOriginal,
      'title_highlighted': titleHighlighted,
      'title_original': titleOriginal,
      'publisher_highlighted': publisherHighlighted,
      'publisher_original': publisherOriginal,
      'image': image,
      'thumbnail': thumbnail,
      'itunes_id': itunesId,
      'latest_pub_date_ms': latestPubDateMs,
      'earliest_pub_date_ms': earliestPubDateMs,
      'id': id,
      'genre_ids': genreIds,
      'listennotes_url': listennotesUrl,
      'total_episodes': totalEpisodes,
      'email': email,
      'explicit_content': explicitContent,
      'website': website,
      'listen_score': listenScore,
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
