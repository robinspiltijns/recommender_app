part of swagger.api;

class CuratedSourceUrlField {
  
  CuratedSourceUrlField();

  @override
  String toString() {
    return 'CuratedSourceUrlField[]';
  }

  CuratedSourceUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CuratedSourceUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedSourceUrlField>() : json.map((value) => new CuratedSourceUrlField.fromJson(value)).toList();
  }

  static Map<String, CuratedSourceUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedSourceUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedSourceUrlField.fromJson(value));
    }
    return map;
  }
}
