part of swagger.api;

class EpisodeSearchResult {
  
  AudioField audio = null;

  AudioLengthSecField audioLengthSec = null;

  RssField rss = null;
/* Highlighted segment of this episode's description */
  String descriptionHighlighted = null;
/* Plain text of this episode's description */
  String descriptionOriginal = null;
/* Highlighted segment of this episode's title */
  String titleHighlighted = null;
/* Plain text of this episode' title */
  String titleOriginal = null;
/* Up to 2 highlighted segments of the audio transcript of this episode. */
  List<String> transcriptsHighlighted = [];

  EpisodeImageField image = null;

  EpisodeThumbnailField thumbnail = null;

  ITunesIdField itunesId = null;

  EpisodePubDateMsField pubDateMs = null;

  EpisodeIdField id = null;

  EpisodeLNUrlField listennotesUrl = null;

  ExplicitField explicitContent = null;

  LinkField link = null;

  EpisodeSearchResultPodcast podcast = null;

  EpisodeSearchResult();

  @override
  String toString() {
    return 'EpisodeSearchResult[audio=$audio, audioLengthSec=$audioLengthSec, rss=$rss, descriptionHighlighted=$descriptionHighlighted, descriptionOriginal=$descriptionOriginal, titleHighlighted=$titleHighlighted, titleOriginal=$titleOriginal, transcriptsHighlighted=$transcriptsHighlighted, image=$image, thumbnail=$thumbnail, itunesId=$itunesId, pubDateMs=$pubDateMs, id=$id, listennotesUrl=$listennotesUrl, explicitContent=$explicitContent, link=$link, podcast=$podcast, ]';
  }

  EpisodeSearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    print("Error happens in next line");
    audio = new AudioField.fromJson(json['audio']);
    audioLengthSec = new AudioLengthSecField.fromJson(json['audio_length_sec']);
    rss = new RssField.fromJson(json['rss']);
    descriptionHighlighted = json['description_highlighted'];
    descriptionOriginal = json['description_original'];
    titleHighlighted = json['title_highlighted'];
    titleOriginal = json['title_original'];
    transcriptsHighlighted = (json['transcripts_highlighted'] as List).map((item) => item as String).toList();
    image = new EpisodeImageField.fromJson(json['image']);
    thumbnail = new EpisodeThumbnailField.fromJson(json['thumbnail']);
    itunesId = new ITunesIdField.fromJson(json['itunes_id']);
    pubDateMs = new EpisodePubDateMsField.fromJson(json['pub_date_ms']);
    id = new EpisodeIdField.fromJson(json['id']);
    listennotesUrl = new EpisodeLNUrlField.fromJson(json['listennotes_url']);
    explicitContent = new ExplicitField.fromJson(json['explicit_content']);
    link = new LinkField.fromJson(json['link']);
    podcast = new EpisodeSearchResultPodcast.fromJson(json['podcast']);
  }

  Map<String, dynamic> toJson() {
    return {
      'audio': audio,
      'audio_length_sec': audioLengthSec,
      'rss': rss,
      'description_highlighted': descriptionHighlighted,
      'description_original': descriptionOriginal,
      'title_highlighted': titleHighlighted,
      'title_original': titleOriginal,
      'transcripts_highlighted': transcriptsHighlighted,
      'image': image,
      'thumbnail': thumbnail,
      'itunes_id': itunesId,
      'pub_date_ms': pubDateMs,
      'id': id,
      'listennotes_url': listennotesUrl,
      'explicit_content': explicitContent,
      'link': link,
      'podcast': podcast
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
