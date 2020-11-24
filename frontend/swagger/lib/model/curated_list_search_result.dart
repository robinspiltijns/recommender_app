part of swagger.api;

class CuratedListSearchResult {
  
  CuratedIdField id = null;

  CuratedPubDateMsField pubDateMs = null;
/* Highlighted segment of this curated list's description */
  String descriptionHighlighted = null;
/* Plain text of this curated list's description */
  String descriptionOriginal = null;
/* Highlighted segment of this curated list's title */
  String titleHighlighted = null;
/* Plain text of this curated list's title */
  String titleOriginal = null;

  CuratedLNUrlField listennotesUrl = null;

  CuratedSourceUrlField sourceUrl = null;

  CuratedSourceDomainField sourceDomain = null;
/* Up to 5 podcasts in this curated list. */
  List<PodcastMinimum> podcasts = [];

  CuratedListSearchResult();

  @override
  String toString() {
    return 'CuratedListSearchResult[id=$id, pubDateMs=$pubDateMs, descriptionHighlighted=$descriptionHighlighted, descriptionOriginal=$descriptionOriginal, titleHighlighted=$titleHighlighted, titleOriginal=$titleOriginal, listennotesUrl=$listennotesUrl, sourceUrl=$sourceUrl, sourceDomain=$sourceDomain, podcasts=$podcasts, ]';
  }

  CuratedListSearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = new CuratedIdField.fromJson(json['id']);
    pubDateMs = new CuratedPubDateMsField.fromJson(json['pub_date_ms']);
    descriptionHighlighted = json['description_highlighted'];
    descriptionOriginal = json['description_original'];
    titleHighlighted = json['title_highlighted'];
    titleOriginal = json['title_original'];
    listennotesUrl = new CuratedLNUrlField.fromJson(json['listennotes_url']);
    sourceUrl = new CuratedSourceUrlField.fromJson(json['source_url']);
    sourceDomain = new CuratedSourceDomainField.fromJson(json['source_domain']);
    podcasts = PodcastMinimum.listFromJson(json['podcasts']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pub_date_ms': pubDateMs,
      'description_highlighted': descriptionHighlighted,
      'description_original': descriptionOriginal,
      'title_highlighted': titleHighlighted,
      'title_original': titleOriginal,
      'listennotes_url': listennotesUrl,
      'source_url': sourceUrl,
      'source_domain': sourceDomain,
      'podcasts': podcasts
     };
  }

  static List<CuratedListSearchResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedListSearchResult>() : json.map((value) => new CuratedListSearchResult.fromJson(value)).toList();
  }

  static Map<String, CuratedListSearchResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedListSearchResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedListSearchResult.fromJson(value));
    }
    return map;
  }
}
