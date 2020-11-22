part of swagger.api;

class EpisodeSimple {
  
  MaybeAudioInvalidField maybeAudioInvalid = null;

  EpisodePubDateMsField pubDateMs = null;

  AudioField audio = null;

  EpisodeLNEditUrlField listennotesEditUrl = null;

  EpisodeImageField image = null;

  EpisodeThumbnailField thumbnail = null;

  EpisodeDescriptionField description = null;

  EpisodeNameField title = null;

  ExplicitField explicitContent = null;

  EpisodeLNUrlField listennotesUrl = null;

  AudioLengthSecField audioLengthSec = null;

  EpisodeIdField id = null;

  LinkField link = null;

  EpisodeSimplePodcast podcast = null;

  EpisodeSimple();

  @override
  String toString() {
    return 'EpisodeSimple[maybeAudioInvalid=$maybeAudioInvalid, pubDateMs=$pubDateMs, audio=$audio, listennotesEditUrl=$listennotesEditUrl, image=$image, thumbnail=$thumbnail, description=$description, title=$title, explicitContent=$explicitContent, listennotesUrl=$listennotesUrl, audioLengthSec=$audioLengthSec, id=$id, link=$link, podcast=$podcast, ]';
  }

  EpisodeSimple.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    maybeAudioInvalid = new MaybeAudioInvalidField.fromJson(json['maybe_audio_invalid']);
    pubDateMs = new EpisodePubDateMsField.fromJson(json['pub_date_ms']);
    audio = new AudioField.fromJson(json['audio']);
    listennotesEditUrl = new EpisodeLNEditUrlField.fromJson(json['listennotes_edit_url']);
    image = new EpisodeImageField.fromJson(json['image']);
    thumbnail = new EpisodeThumbnailField.fromJson(json['thumbnail']);
    description = new EpisodeDescriptionField.fromJson(json['description']);
    title = new EpisodeNameField.fromJson(json['title']);
    explicitContent = new ExplicitField.fromJson(json['explicit_content']);
    listennotesUrl = new EpisodeLNUrlField.fromJson(json['listennotes_url']);
    audioLengthSec = new AudioLengthSecField.fromJson(json['audio_length_sec']);
    id = new EpisodeIdField.fromJson(json['id']);
    link = new LinkField.fromJson(json['link']);
    podcast = new EpisodeSimplePodcast.fromJson(json['podcast']);
  }

  Map<String, dynamic> toJson() {
    return {
      'maybe_audio_invalid': maybeAudioInvalid,
      'pub_date_ms': pubDateMs,
      'audio': audio,
      'listennotes_edit_url': listennotesEditUrl,
      'image': image,
      'thumbnail': thumbnail,
      'description': description,
      'title': title,
      'explicit_content': explicitContent,
      'listennotes_url': listennotesUrl,
      'audio_length_sec': audioLengthSec,
      'id': id,
      'link': link,
      'podcast': podcast
     };
  }

  static List<EpisodeSimple> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeSimple>() : json.map((value) => new EpisodeSimple.fromJson(value)).toList();
  }

  static Map<String, EpisodeSimple> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeSimple>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeSimple.fromJson(value));
    }
    return map;
  }
}
