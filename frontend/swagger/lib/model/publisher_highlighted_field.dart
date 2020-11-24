part of swagger.api;

class PublisherHighlightedField {
  
  PublisherHighlightedField();

  @override
  String toString() {
    return 'PublisherHighlightedField[]';
  }

  PublisherHighlightedField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PublisherHighlightedField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PublisherHighlightedField>() : json.map((value) => new PublisherHighlightedField.fromJson(value)).toList();
  }

  static Map<String, PublisherHighlightedField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PublisherHighlightedField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PublisherHighlightedField.fromJson(value));
    }
    return map;
  }
}
