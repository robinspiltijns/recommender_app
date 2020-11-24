part of swagger.api;

class EpisodeImageField {
  
  EpisodeImageField();

  @override
  String toString() {
    return 'EpisodeImageField[]';
  }

  EpisodeImageField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeImageField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeImageField>() : json.map((value) => new EpisodeImageField.fromJson(value)).toList();
  }

  static Map<String, EpisodeImageField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeImageField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeImageField.fromJson(value));
    }
    return map;
  }
}
