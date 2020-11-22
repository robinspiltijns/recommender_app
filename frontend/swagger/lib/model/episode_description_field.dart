part of swagger.api;

class EpisodeDescriptionField {
  
  EpisodeDescriptionField();

  @override
  String toString() {
    return 'EpisodeDescriptionField[]';
  }

  EpisodeDescriptionField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeDescriptionField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeDescriptionField>() : json.map((value) => new EpisodeDescriptionField.fromJson(value)).toList();
  }

  static Map<String, EpisodeDescriptionField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeDescriptionField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeDescriptionField.fromJson(value));
    }
    return map;
  }
}
