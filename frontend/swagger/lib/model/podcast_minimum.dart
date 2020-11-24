part of swagger.api;

class PodcastMinimum {
  /* Podcast id. */
  String id = null;
/* Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300).  */
  String image = null;
/* Podcast name. */
  String title = null;
/* Podcast publisher name. */
  String publisher = null;
/* Thumbnail image url for this podcast's artwork (300x300). */
  String thumbnail = null;
/* The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;

  PodcastMinimum();

  @override
  String toString() {
    return 'PodcastMinimum[id=$id, image=$image, title=$title, publisher=$publisher, thumbnail=$thumbnail, listennotesUrl=$listennotesUrl, ]';
  }

  PodcastMinimum.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    image = json['image'];
    title = json['title'];
    publisher = json['publisher'];
    thumbnail = json['thumbnail'];
    listennotesUrl = json['listennotes_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'publisher': publisher,
      'thumbnail': thumbnail,
      'listennotes_url': listennotesUrl
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
