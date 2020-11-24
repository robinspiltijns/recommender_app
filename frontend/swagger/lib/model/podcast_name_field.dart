part of swagger.api;

class PodcastNameField {
  
  PodcastNameField();

  @override
  String toString() {
    return 'PodcastNameField[]';
  }

  PodcastNameField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastNameField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastNameField>() : json.map((value) => new PodcastNameField.fromJson(value)).toList();
  }

  static Map<String, PodcastNameField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastNameField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastNameField.fromJson(value));
    }
    return map;
  }
}
