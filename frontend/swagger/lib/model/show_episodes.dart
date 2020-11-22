part of swagger.api;

class ShowEpisodes {
  /* Episode id. */
  String id = null;
/* Web link of this episode. */
  String link = null;
/* Audio url of this episode, which can be played directly. */
  String audio = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;
/* Episode name. */
  String title = null;
/* Thumbnail image url for this podcast's artwork (300x300). */
  String thumbnail = null;
/* Html of this episode's full description */
  String description = null;
/* Published date for this episode. In millisecond. */
  int pubDateMs = null;
/* The url of this episode on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;
/* Audio length of this episode. In seconds. */
  int audioLengthSec = null;
/* Whether this podcast contains explicit language. */
  bool explicitContent = null;
/* Whether or not this episode's audio is invalid. Podcasters may delete the original audio. */
  bool maybeAudioInvalid = null;
/* Edit url of this episode where you can update the audio url if you find the audio is broken. */
  String listennotesEditUrl = null;

  ShowEpisodes();

  @override
  String toString() {
    return 'ShowEpisodes[id=$id, link=$link, audio=$audio, image=$image, title=$title, thumbnail=$thumbnail, description=$description, pubDateMs=$pubDateMs, listennotesUrl=$listennotesUrl, audioLengthSec=$audioLengthSec, explicitContent=$explicitContent, maybeAudioInvalid=$maybeAudioInvalid, listennotesEditUrl=$listennotesEditUrl, ]';
  }

  ShowEpisodes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    link = json['link'];
    audio = json['audio'];
    image = json['image'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    pubDateMs = json['pub_date_ms'];
    listennotesUrl = json['listennotes_url'];
    audioLengthSec = json['audio_length_sec'];
    explicitContent = json['explicit_content'];
    maybeAudioInvalid = json['maybe_audio_invalid'];
    listennotesEditUrl = json['listennotes_edit_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'link': link,
      'audio': audio,
      'image': image,
      'title': title,
      'thumbnail': thumbnail,
      'description': description,
      'pub_date_ms': pubDateMs,
      'listennotes_url': listennotesUrl,
      'audio_length_sec': audioLengthSec,
      'explicit_content': explicitContent,
      'maybe_audio_invalid': maybeAudioInvalid,
      'listennotes_edit_url': listennotesEditUrl
     };
  }

  static List<ShowEpisodes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ShowEpisodes>() : json.map((value) => new ShowEpisodes.fromJson(value)).toList();
  }

  static Map<String, ShowEpisodes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ShowEpisodes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ShowEpisodes.fromJson(value));
    }
    return map;
  }
}
