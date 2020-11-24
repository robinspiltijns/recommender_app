part of swagger.api;

class PublisherOriginalField {
  
  PublisherOriginalField();

  @override
  String toString() {
    return 'PublisherOriginalField[]';
  }

  PublisherOriginalField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PublisherOriginalField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PublisherOriginalField>() : json.map((value) => new PublisherOriginalField.fromJson(value)).toList();
  }

  static Map<String, PublisherOriginalField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PublisherOriginalField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PublisherOriginalField.fromJson(value));
    }
    return map;
  }
}
