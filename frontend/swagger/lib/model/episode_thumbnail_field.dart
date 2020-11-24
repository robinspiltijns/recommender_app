part of swagger.api;

class EpisodeThumbnailField {
  
  EpisodeThumbnailField();

  @override
  String toString() {
    return 'EpisodeThumbnailField[]';
  }

  EpisodeThumbnailField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodeThumbnailField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodeThumbnailField>() : json.map((value) => new EpisodeThumbnailField.fromJson(value)).toList();
  }

  static Map<String, EpisodeThumbnailField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodeThumbnailField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodeThumbnailField.fromJson(value));
    }
    return map;
  }
}
