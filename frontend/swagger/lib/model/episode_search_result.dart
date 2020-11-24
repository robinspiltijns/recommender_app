part of swagger.api;

class EpisodeSearchResult {
  /* Episode id. */
  String id = null;
/* RSS url of this podcast. This field is available only in the PRO plan. */
  String rss = null;
/* Web link of this episode. */
  String link = null;
/* Audio url of this episode, which can be played directly. */
  String audio = null;
/* Image url for this episode. If an episode doesn't have its own image, then this field would be the url of the podcast artwork image. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;

  EpisodeSearchResultPodcast podcast = null;
/* iTunes id for this podcast. */
  int itunesId = null;
/* Thumbnail image (300x300) url for this episode. If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image.  */
  String thumbnail = null;
/* Published date for this episode. In millisecond. */
  int pubDateMs = null;
/* Plain text of this episode' title */
  String titleOriginal = null;
/* The url of this episode on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;
/* Audio length of this episode. In seconds. */
  int audioLengthSec = null;
/* Whether this podcast contains explicit language. */
  bool explicitContent = null;
/* Highlighted segment of this episode's title */
  String titleHighlighted = null;
/* Plain text of this episode's description */
  String descriptionOriginal = null;
/* Highlighted segment of this episode's description */
  String descriptionHighlighted = null;

  EpisodeSearchResult();

  @override
  String toString() {
    return 'EpisodeSearchResult[id=$id, rss=$rss, link=$link, audio=$audio, image=$image, podcast=$podcast, itunesId=$itunesId, thumbnail=$thumbnail, pubDateMs=$pubDateMs, titleOriginal=$titleOriginal, listennotesUrl=$listennotesUrl, audioLengthSec=$audioLengthSec, explicitContent=$explicitContent, titleHighlighted=$titleHighlighted, descriptionOriginal=$descriptionOriginal, descriptionHighlighted=$descriptionHighlighted, ]';
  }

  EpisodeSearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    rss = json['rss'];
    link = json['link'];
    audio = json['audio'];
    image = json['image'];
    podcast = new EpisodeSearchResultPodcast.fromJson(json['podcast']);
    itunesId = json['itunes_id'];
    thumbnail = json['thumbnail'];
    pubDateMs = json['pub_date_ms'];
    titleOriginal = json['title_original'];
    listennotesUrl = json['listennotes_url'];
    audioLengthSec = json['audio_length_sec'];
    explicitContent = json['explicit_content'];
    titleHighlighted = json['title_highlighted'];
    descriptionOriginal = json['description_original'];
    descriptionHighlighted = json['description_highlighted'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rss': rss,
      'link': link,
      'audio': audio,
      'image': image,
      'podcast': podcast,
      'itunes_id': itunesId,
      'thumbnail': thumbnail,
      'pub_date_ms': pubDateMs,
      'title_original': titleOriginal,
      'listennotes_url': listennotesUrl,
      'audio_length_sec': audioLengthSec,
      'explicit_content': explicitContent,
      'title_highlighted': titleHighlighted,
      'description_original': descriptionOriginal,
      'description_highlighted': descriptionHighlighted
     };
  }

  static List<EpisodeSearchResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeSearchResult>() : json.map((value) => new EpisodeSearchResult.fromJson(value)).toList();
  }

  static Map<String, EpisodeSearchResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeSearchResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeSearchResult.fromJson(value));
    }
    return map;
  }
}
