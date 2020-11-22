part of swagger.api;

class Show {
  /* Podcast id. */
  String id = null;
/* RSS url of this podcast. This field is available only in the PRO plan. */
  String rss = null;
/* The type of this podcast - episodic or serial. */
  String type = null;
  //enum typeEnum {  episodic,  serial,  };
/* The email of this podcast's producer. This field is available only in the PRO plan. */
  String email = null;

  ShowExtra extra = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;
/* Podcast name. */
  String title = null;
/* The country where this podcast is produced. */
  String country = null;
/* Website url of this podcast. */
  String website = null;

  List<ShowEpisodes> episodes = [];
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

  ShowLookingFor lookingFor = null;
/* The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  int listenScore = null;
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
/* The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score  */
  String listenScoreGlobalRank = null;

  Show();

  @override
  String toString() {
    return 'Show[id=$id, rss=$rss, type=$type, email=$email, extra=$extra, image=$image, title=$title, country=$country, website=$website, episodes=$episodes, language=$language, genreIds=$genreIds, itunesId=$itunesId, publisher=$publisher, thumbnail=$thumbnail, isClaimed=$isClaimed, description=$description, lookingFor=$lookingFor, listenScore=$listenScore, totalEpisodes=$totalEpisodes, listennotesUrl=$listennotesUrl, explicitContent=$explicitContent, latestPubDateMs=$latestPubDateMs, earliestPubDateMs=$earliestPubDateMs, nextEpisodePubDate=$nextEpisodePubDate, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  Show.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    rss = json['rss'];
    type = json['type'];
    email = json['email'];
    extra = new ShowExtra.fromJson(json['extra']);
    image = json['image'];
    title = json['title'];
    country = json['country'];
    website = json['website'];
    episodes = ShowEpisodes.listFromJson(json['episodes']);
    language = json['language'];
    genreIds = (json['genre_ids'] as List).map((item) => item as int).toList();
    itunesId = json['itunes_id'];
    publisher = json['publisher'];
    thumbnail = json['thumbnail'];
    isClaimed = json['is_claimed'];
    description = json['description'];
    lookingFor = new ShowLookingFor.fromJson(json['looking_for']);
    listenScore = json['listen_score'];
    totalEpisodes = json['total_episodes'];
    listennotesUrl = json['listennotes_url'];
    explicitContent = json['explicit_content'];
    latestPubDateMs = json['latest_pub_date_ms'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    nextEpisodePubDate = json['next_episode_pub_date'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
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
      'listen_score': listenScore,
      'total_episodes': totalEpisodes,
      'listennotes_url': listennotesUrl,
      'explicit_content': explicitContent,
      'latest_pub_date_ms': latestPubDateMs,
      'earliest_pub_date_ms': earliestPubDateMs,
      'next_episode_pub_date': nextEpisodePubDate,
      'listen_score_global_rank': listenScoreGlobalRank
     };
  }

  static List<Show> listFromJson(List<dynamic> json) {
    return json == null ? new List<Show>() : json.map((value) => new Show.fromJson(value)).toList();
  }

  static Map<String, Show> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Show>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Show.fromJson(value));
    }
    return map;
  }
}
