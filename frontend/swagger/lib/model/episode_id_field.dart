part of swagger.api;

class EpisodeIdField {
  
  EpisodeIdField();

  @override
  String toString() {
    return 'EpisodeIdField[]';
  }

  EpisodeIdField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeIdField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeIdField>() : json.map((value) => new EpisodeIdField.fromJson(value)).toList();
  }

  static Map<String, EpisodeIdField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeIdField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeIdField.fromJson(value));
    }
    return map;
  }
}
