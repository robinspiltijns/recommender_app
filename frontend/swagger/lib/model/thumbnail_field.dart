part of swagger.api;

class ThumbnailField {
  
  ThumbnailField();

  @override
  String toString() {
    return 'ThumbnailField[]';
  }

  ThumbnailField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ThumbnailField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ThumbnailField>() : json.map((value) => new ThumbnailField.fromJson(value)).toList();
  }

  static Map<String, ThumbnailField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ThumbnailField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ThumbnailField.fromJson(value));
    }
    return map;
  }
}
