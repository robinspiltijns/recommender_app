part of swagger.api;

class CuratedIdField {
  
  CuratedIdField();

  @override
  String toString() {
    return 'CuratedIdField[]';
  }

  CuratedIdField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CuratedIdField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedIdField>() : json.map((value) => new CuratedIdField.fromJson(value)).toList();
  }

  static Map<String, CuratedIdField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedIdField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedIdField.fromJson(value));
    }
    return map;
  }
}
