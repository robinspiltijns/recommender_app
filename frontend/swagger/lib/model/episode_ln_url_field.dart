part of swagger.api;

class EpisodeLNUrlField {
  
  EpisodeLNUrlField();

  @override
  String toString() {
    return 'EpisodeLNUrlField[]';
  }

  EpisodeLNUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeLNUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeLNUrlField>() : json.map((value) => new EpisodeLNUrlField.fromJson(value)).toList();
  }

  static Map<String, EpisodeLNUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeLNUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeLNUrlField.fromJson(value));
    }
    return map;
  }
}
