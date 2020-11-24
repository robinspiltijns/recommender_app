part of swagger.api;

class EpisodeNameField {
  
  EpisodeNameField();

  @override
  String toString() {
    return 'EpisodeNameField[]';
  }

  EpisodeNameField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeNameField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeNameField>() : json.map((value) => new EpisodeNameField.fromJson(value)).toList();
  }

  static Map<String, EpisodeNameField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeNameField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeNameField.fromJson(value));
    }
    return map;
  }
}
