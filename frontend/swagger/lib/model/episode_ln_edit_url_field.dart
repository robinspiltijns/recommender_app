part of swagger.api;

class EpisodeLNEditUrlField {
  
  EpisodeLNEditUrlField();

  @override
  String toString() {
    return 'EpisodeLNEditUrlField[]';
  }

  EpisodeLNEditUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeLNEditUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeLNEditUrlField>() : json.map((value) => new EpisodeLNEditUrlField.fromJson(value)).toList();
  }

  static Map<String, EpisodeLNEditUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeLNEditUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeLNEditUrlField.fromJson(value));
    }
    return map;
  }
}
