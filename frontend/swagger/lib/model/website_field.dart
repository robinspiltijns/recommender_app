part of swagger.api;

class WebsiteField {
  
  WebsiteField();

  @override
  String toString() {
    return 'WebsiteField[]';
  }

  WebsiteField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<WebsiteField> listFromJson(List<dynamic> json) {
    return json == null ? new List<WebsiteField>() : json.map((value) => new WebsiteField.fromJson(value)).toList();
  }

  static Map<String, WebsiteField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WebsiteField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WebsiteField.fromJson(value));
    }
    return map;
  }
}
