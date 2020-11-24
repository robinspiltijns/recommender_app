part of swagger.api;

class ExplicitField {
  
  ExplicitField();

  @override
  String toString() {
    return 'ExplicitField[]';
  }

  ExplicitField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ExplicitField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ExplicitField>() : json.map((value) => new ExplicitField.fromJson(value)).toList();
  }

  static Map<String, ExplicitField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ExplicitField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ExplicitField.fromJson(value));
    }
    return map;
  }
}
