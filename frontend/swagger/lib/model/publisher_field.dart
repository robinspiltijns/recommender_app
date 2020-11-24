part of swagger.api;

class PublisherField {
  
  PublisherField();

  @override
  String toString() {
    return 'PublisherField[]';
  }

  PublisherField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<PublisherField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PublisherField>() : json.map((value) => new PublisherField.fromJson(value)).toList();
  }

  static Map<String, PublisherField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PublisherField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PublisherField.fromJson(value));
    }
    return map;
  }
}
