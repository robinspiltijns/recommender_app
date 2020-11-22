part of swagger.api;

class PodcastMinimum {
  
  ImageField image = null;

  ThumbnailField thumbnail = null;

  PodcastNameField title = null;

  PodcastLNUrlField listennotesUrl = null;

  PodcastIdField id = null;

  PublisherField publisher = null;

  ListenScoreField listenScore = null;

  ListenScoreGlobalRankField listenScoreGlobalRank = null;

  PodcastMinimum();

  @override
  String toString() {
    return 'PodcastMinimum[image=$image, thumbnail=$thumbnail, title=$title, listennotesUrl=$listennotesUrl, id=$id, publisher=$publisher, listenScore=$listenScore, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  PodcastMinimum.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    image = new ImageField.fromJson(json['image']);
    thumbnail = new ThumbnailField.fromJson(json['thumbnail']);
    title = new PodcastNameField.fromJson(json['title']);
    listennotesUrl = new PodcastLNUrlField.fromJson(json['listennotes_url']);
    id = new PodcastIdField.fromJson(json['id']);
    publisher = new PublisherField.fromJson(json['publisher']);
    listenScore = new ListenScoreField.fromJson(json['listen_score']);
    listenScoreGlobalRank = new ListenScoreGlobalRankField.fromJson(json['listen_score_global_rank']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'thumbnail': thumbnail,
      'title': title,
      'listennotes_url': listennotesUrl,
      'id': id,
      'publisher': publisher,
      'listen_score': listenScore,
      'listen_score_global_rank': listenScoreGlobalRank
     };
  }

  static List<PodcastMinimum> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastMinimum>() : json.map((value) => new PodcastMinimum.fromJson(value)).toList();
  }

  static Map<String, PodcastMinimum> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastMinimum>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastMinimum.fromJson(value));
    }
    return map;
  }
}
