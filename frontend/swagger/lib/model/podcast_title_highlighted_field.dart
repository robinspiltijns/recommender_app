part of swagger.api;

class PodcastTitleHighlightedField {
  
  PodcastTitleHighlightedField();

  @override
  String toString() {
    return 'PodcastTitleHighlightedField[]';
  }

  PodcastTitleHighlightedField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastTitleHighlightedField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastTitleHighlightedField>() : json.map((value) => new PodcastTitleHighlightedField.fromJson(value)).toList();
  }

  static Map<String, PodcastTitleHighlightedField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastTitleHighlightedField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastTitleHighlightedField.fromJson(value));
    }
    return map;
  }
}
