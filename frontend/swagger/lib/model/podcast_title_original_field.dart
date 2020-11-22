part of swagger.api;

class PodcastTitleOriginalField {
  
  PodcastTitleOriginalField();

  @override
  String toString() {
    return 'PodcastTitleOriginalField[]';
  }

  PodcastTitleOriginalField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastTitleOriginalField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastTitleOriginalField>() : json.map((value) => new PodcastTitleOriginalField.fromJson(value)).toList();
  }

  static Map<String, PodcastTitleOriginalField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastTitleOriginalField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastTitleOriginalField.fromJson(value));
    }
    return map;
  }
}
