part of swagger.api;

class PodcastLNUrlField {
  
  PodcastLNUrlField();

  @override
  String toString() {
    return 'PodcastLNUrlField[]';
  }

  PodcastLNUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastLNUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastLNUrlField>() : json.map((value) => new PodcastLNUrlField.fromJson(value)).toList();
  }

  static Map<String, PodcastLNUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastLNUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastLNUrlField.fromJson(value));
    }
    return map;
  }
}
