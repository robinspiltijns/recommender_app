part of swagger.api;

class RssField {
  
  RssField();

  @override
  String toString() {
    return 'RssField[]';
  }

  RssField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<RssField> listFromJson(List<dynamic> json) {
    return json == null ? new List<RssField>() : json.map((value) => new RssField.fromJson(value)).toList();
  }

  static Map<String, RssField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RssField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RssField.fromJson(value));
    }
    return map;
  }
}
