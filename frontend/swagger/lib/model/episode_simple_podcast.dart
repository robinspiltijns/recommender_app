part of swagger.api;

class EpisodeSimplePodcast {
  
  PodcastIdField id = null;

  PodcastNameField title = null;

  PublisherField publisher = null;

  ImageField image = null;

  ThumbnailField thumbnail = null;

  PodcastLNUrlField listennotesUrl = null;

  EpisodeSimplePodcast();

  @override
  String toString() {
    return 'EpisodeSimplePodcast[id=$id, title=$title, publisher=$publisher, image=$image, thumbnail=$thumbnail, listennotesUrl=$listennotesUrl, ]';
  }

  EpisodeSimplePodcast.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = new PodcastIdField.fromJson(json['id']);
    title = new PodcastNameField.fromJson(json['title']);
    publisher = new PublisherField.fromJson(json['publisher']);
    image = new ImageField.fromJson(json['image']);
    thumbnail = new ThumbnailField.fromJson(json['thumbnail']);
    listennotesUrl = new PodcastLNUrlField.fromJson(json['listennotes_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'publisher': publisher,
      'image': image,
      'thumbnail': thumbnail,
      'listennotes_url': listennotesUrl
     };
  }

  static List<EpisodeSimplePodcast> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeSimplePodcast>() : json.map((value) => new EpisodeSimplePodcast.fromJson(value)).toList();
  }

  static Map<String, EpisodeSimplePodcast> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeSimplePodcast>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeSimplePodcast.fromJson(value));
    }
    return map;
  }
}
