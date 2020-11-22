part of swagger.api;

class GenreIdsField {
  
  GenreIdsField();

  @override
  String toString() {
    return 'GenreIdsField[]';
  }

  GenreIdsField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<GenreIdsField> listFromJson(List<dynamic> json) {
    return json == null ? new List<GenreIdsField>() : json.map((value) => new GenreIdsField.fromJson(value)).toList();
  }

  static Map<String, GenreIdsField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GenreIdsField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GenreIdsField.fromJson(value));
    }
    return map;
  }
}
