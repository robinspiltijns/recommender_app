part of swagger.api;

class PodcastIdField {
  
  PodcastIdField();

  @override
  String toString() {
    return 'PodcastIdField[]';
  }

  PodcastIdField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastIdField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastIdField>() : json.map((value) => new PodcastIdField.fromJson(value)).toList();
  }

  static Map<String, PodcastIdField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastIdField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastIdField.fromJson(value));
    }
    return map;
  }
}
