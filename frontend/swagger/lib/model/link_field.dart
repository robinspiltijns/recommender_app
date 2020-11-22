part of swagger.api;

class LinkField {
  
  LinkField();

  @override
  String toString() {
    return 'LinkField[]';
  }

  LinkField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<LinkField> listFromJson(List<dynamic> json) {
    return json == null ? new List<LinkField>() : json.map((value) => new LinkField.fromJson(value)).toList();
  }

  static Map<String, LinkField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LinkField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LinkField.fromJson(value));
    }
    return map;
  }
}
