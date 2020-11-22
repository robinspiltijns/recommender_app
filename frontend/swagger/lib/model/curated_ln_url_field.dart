part of swagger.api;

class CuratedLNUrlField {
  
  CuratedLNUrlField();

  @override
  String toString() {
    return 'CuratedLNUrlField[]';
  }

  CuratedLNUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CuratedLNUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedLNUrlField>() : json.map((value) => new CuratedLNUrlField.fromJson(value)).toList();
  }

  static Map<String, CuratedLNUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedLNUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedLNUrlField.fromJson(value));
    }
    return map;
  }
}
