part of swagger.api;

class PodcastFull {
  /* Podcast id. */
  String id = null;
/* RSS url of this podcast. This field is available only in the PRO plan. */
  String rss = null;
/* The type of this podcast - episodic or serial. */
  String type = null;
  //enum typeEnum {  episodic,  serial,  };
/* The email of this podcast's producer. This field is available only in the PRO plan. */
  String email = null;

  PodcastExtraField extra = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300). */
  String image = null;
/* Podcast name. */
  String title = null;
/* The country where this podcast is produced. */
  String country = null;
/* Website url of this podcast. */
  String website = null;

  List<EpisodeMinimum> episodes = [];
/* The language of this podcast. You can get all supported languages from `GET /languages`. */
  String language = null;

  List<int> genreIds = [];
/* iTunes id for this podcast. */
  int itunesId = null;
/* Podcast publisher name. */
  String publisher = null;
/* Thumbnail image url for this podcast's artwork (300x300). */
  String thumbnail = null;
/* Whether this podcast is claimed by its producer on [ListenNotes.com](https://www.ListenNotes.com). */
  bool isClaimed = null;
/* Html of this episode's full description */
  String description = null;

  PodcastLookingForField lookingFor = null;
/* Total number of episodes in this podcast. */
  int totalEpisodes = null;
/* The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;
/* Whether this podcast contains explicit language. */
  bool explicitContent = null;
/* The published date of the latest episode of this podcast. In milliseconds */
  int latestPubDateMs = null;
/* The published date of the oldest episode of this podcast. In milliseconds */
  int earliestPubDateMs = null;
/* Passed to the **next_episode_pub_date** parameter of `GET /podcasts/{id}` to paginate through episodes of that podcast. */
  int nextEpisodePubDate = null;

  PodcastFull();

  @override
  String toString() {
    return 'PodcastFull[id=$id, rss=$rss, type=$type, email=$email, extra=$extra, image=$image, title=$title, country=$country, website=$website, episodes=$episodes, language=$language, genreIds=$genreIds, itunesId=$itunesId, publisher=$publisher, thumbnail=$thumbnail, isClaimed=$isClaimed, description=$description, lookingFor=$lookingFor, totalEpisodes=$totalEpisodes, listennotesUrl=$listennotesUrl, explicitContent=$explicitContent, latestPubDateMs=$latestPubDateMs, earliestPubDateMs=$earliestPubDateMs, nextEpisodePubDate=$nextEpisodePubDate, ]';
  }

  PodcastFull.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    rss = json['rss'];
    type = json['type'];
    email = json['email'];
    extra = new PodcastExtraField.fromJson(json['extra']);
    image = json['image'];
    title = json['title'];
    country = json['country'];
    website = json['website'];
    episodes = EpisodeMinimum.listFromJson(json['episodes']);
    language = json['language'];
    genreIds = (json['genre_ids'] as List).map((item) => item as int).toList();
    itunesId = json['itunes_id'];
    publisher = json['publisher'];
    thumbnail = json['thumbnail'];
    isClaimed = json['is_claimed'];
    description = json['description'];
    lookingFor = new PodcastLookingForField.fromJson(json['looking_for']);
    totalEpisodes = json['total_episodes'];
    listennotesUrl = json['listennotes_url'];
    explicitContent = json['explicit_content'];
    latestPubDateMs = json['latest_pub_date_ms'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    nextEpisodePubDate = json['next_episode_pub_date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rss': rss,
      'type': type,
      'email': email,
      'extra': extra,
      'image': image,
      'title': title,
      'country': country,
      'website': website,
      'episodes': episodes,
      'language': language,
      'genre_ids': genreIds,
      'itunes_id': itunesId,
      'publisher': publisher,
      'thumbnail': thumbnail,
      'is_claimed': isClaimed,
      'description': description,
      'looking_for': lookingFor,
      'total_episodes': totalEpisodes,
      'listennotes_url': listennotesUrl,
      'explicit_content': explicitContent,
      'latest_pub_date_ms': latestPubDateMs,
      'earliest_pub_date_ms': earliestPubDateMs,
      'next_episode_pub_date': nextEpisodePubDate
     };
  }

  static List<PodcastFull> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastFull>() : json.map((value) => new PodcastFull.fromJson(value)).toList();
  }

  static Map<String, PodcastFull> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastFull>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastFull.fromJson(value));
    }
    return map;
  }
}
