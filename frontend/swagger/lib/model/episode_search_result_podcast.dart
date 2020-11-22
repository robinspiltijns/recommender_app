part of swagger.api;

class EpisodeSearchResultPodcast {
  
  PodcastIdField id = null;

  GenreIdsField genreIds = null;

  PodcastLNUrlField listennotesUrl = null;

  PodcastTitleHighlightedField titleHighlighted = null;

  PodcastTitleOriginalField titleOriginal = null;

  PublisherHighlightedField publisherHighlighted = null;

  PublisherOriginalField publisherOriginal = null;

  ImageField image = null;

  ThumbnailField thumbnail = null;

  ListenScoreField listenScore = null;

  ListenScoreGlobalRankField listenScoreGlobalRank = null;

  EpisodeSearchResultPodcast();

  @override
  String toString() {
    return 'EpisodeSearchResultPodcast[id=$id, genreIds=$genreIds, listennotesUrl=$listennotesUrl, titleHighlighted=$titleHighlighted, titleOriginal=$titleOriginal, publisherHighlighted=$publisherHighlighted, publisherOriginal=$publisherOriginal, image=$image, thumbnail=$thumbnail, listenScore=$listenScore, listenScoreGlobalRank=$listenScoreGlobalRank, ]';
  }

  EpisodeSearchResultPodcast.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = new PodcastIdField.fromJson(json['id']);
    genreIds = new GenreIdsField.fromJson(json['genre_ids']);
    listennotesUrl = new PodcastLNUrlField.fromJson(json['listennotes_url']);
    titleHighlighted = new PodcastTitleHighlightedField.fromJson(json['title_highlighted']);
    titleOriginal = new PodcastTitleOriginalField.fromJson(json['title_original']);
    publisherHighlighted = new PublisherHighlightedField.fromJson(json['publisher_highlighted']);
    publisherOriginal = new PublisherOriginalField.fromJson(json['publisher_original']);
    image = new ImageField.fromJson(json['image']);
    thumbnail = new ThumbnailField.fromJson(json['thumbnail']);
    listenScore = new ListenScoreField.fromJson(json['listen_score']);
    listenScoreGlobalRank = new ListenScoreGlobalRankField.fromJson(json['listen_score_global_rank']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'genre_ids': genreIds,
      'listennotes_url': listennotesUrl,
      'title_highlighted': titleHighlighted,
      'title_original': titleOriginal,
      'publisher_highlighted': publisherHighlighted,
      'publisher_original': publisherOriginal,
      'image': image,
      'thumbnail': thumbnail,
      'listen_score': listenScore,
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
