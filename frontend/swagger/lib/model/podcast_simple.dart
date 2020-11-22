part of swagger.api;

class PodcastSimple {
  
  IsClaimedField isClaimed = null;

  PodcastTypeField type = null;

  ExplicitField explicitContent = null;

  WebsiteField website = null;

  TotalEpisodesField totalEpisodes = null;

  EarliestPubDateMsField earliestPubDateMs = null;

  RssField rss = null;

  LatestPubDateMsField latestPubDateMs = null;

  PodcastNameField title = null;

  LanguageField language = null;

  PodcastDescriptionField description = null;

  EmailField email = null;

  ImageField image = null;

  ThumbnailField thumbnail = null;

  PodcastLNUrlField listennotesUrl = null;

  PodcastIdField id = null;

  CountryField country = null;

  PublisherField publisher = null;

  ITunesIdField itunesId = null;

  PodcastLookingForField lookingFor = null;

  PodcastExtraField extra = null;

  GenreIdsField genreIds = null;

  ListenScoreField listenScore = null;

  ListenScoreGlobalRankField listenScoreGlobalRank = null;

  PodcastSimple();

  @override
  String toString() {
    return 'PodcastSimple[isClaimed=$isClaimed, type=$type, explicitContent=$explicitContent, website=$website, totalEpisodes=$totalEpisodes, earliestPubDateMs=$earliestPubDateMs, rss=$rss, latestPubDateMs=$latestPubDateMs, title=$title, language=$language, description=$description, email=$email, image=$image, thumbnail=$thumbnail, listennotesUrl=$listennotesUrl, id=$id, country=$country, publisher=$publisher, itunesId=$itunesId, lookingFor=$lookingFor, extra=$extra, genreIds=$genreIds, listenScore=$listenScore, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  PodcastSimple.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    isClaimed = new IsClaimedField.fromJson(json['is_claimed']);
    type = new PodcastTypeField.fromJson(json['type']);
    explicitContent = new ExplicitField.fromJson(json['explicit_content']);
    website = new WebsiteField.fromJson(json['website']);
    totalEpisodes = new TotalEpisodesField.fromJson(json['total_episodes']);
    earliestPubDateMs = new EarliestPubDateMsField.fromJson(json['earliest_pub_date_ms']);
    rss = new RssField.fromJson(json['rss']);
    latestPubDateMs = new LatestPubDateMsField.fromJson(json['latest_pub_date_ms']);
    title = new PodcastNameField.fromJson(json['title']);
    language = new LanguageField.fromJson(json['language']);
    description = new PodcastDescriptionField.fromJson(json['description']);
    email = new EmailField.fromJson(json['email']);
    image = new ImageField.fromJson(json['image']);
    thumbnail = new ThumbnailField.fromJson(json['thumbnail']);
    listennotesUrl = new PodcastLNUrlField.fromJson(json['listennotes_url']);
    id = new PodcastIdField.fromJson(json['id']);
    country = new CountryField.fromJson(json['country']);
    publisher = new PublisherField.fromJson(json['publisher']);
    itunesId = new ITunesIdField.fromJson(json['itunes_id']);
    lookingFor = new PodcastLookingForField.fromJson(json['looking_for']);
    extra = new PodcastExtraField.fromJson(json['extra']);
    genreIds = new GenreIdsField.fromJson(json['genre_ids']);
    listenScore = new ListenScoreField.fromJson(json['listen_score']);
    listenScoreGlobalRank = new ListenScoreGlobalRankField.fromJson(json['listen_score_global_rank']);
  }

  Map<String, dynamic> toJson() {
    return {
      'is_claimed': isClaimed,
      'type': type,
      'explicit_content': explicitContent,
      'website': website,
      'total_episodes': totalEpisodes,
      'earliest_pub_date_ms': earliestPubDateMs,
      'rss': rss,
      'latest_pub_date_ms': latestPubDateMs,
      'title': title,
      'language': language,
      'description': description,
      'email': email,
      'image': image,
      'thumbnail': thumbnail,
      'listennotes_url': listennotesUrl,
      'id': id,
      'country': country,
      'publisher': publisher,
      'itunes_id': itunesId,
      'looking_for': lookingFor,
      'extra': extra,
      'genre_ids': genreIds,
      'listen_score': listenScore,
      'listen_score_global_rank': listenScoreGlobalRank
     };
  }

  static List<PodcastSimple> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastSimple>() : json.map((value) => new PodcastSimple.fromJson(value)).toList();
  }

  static Map<String, PodcastSimple> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastSimple>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastSimple.fromJson(value));
    }
    return map;
  }
}
