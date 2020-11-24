part of swagger.api;

class PodcastDescriptionField {
  
  PodcastDescriptionField();

  @override
  String toString() {
    return 'PodcastDescriptionField[]';
  }

  PodcastDescriptionField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PodcastDescriptionField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastDescriptionField>() : json.map((value) => new PodcastDescriptionField.fromJson(value)).toList();
  }

  static Map<String, PodcastDescriptionField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastDescriptionField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastDescriptionField.fromJson(value));
    }
    return map;
  }
}
