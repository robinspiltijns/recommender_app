part of swagger.api;

class EpisodePubDateMsField {
  
  EpisodePubDateMsField();

  @override
  String toString() {
    return 'EpisodePubDateMsField[]';
  }

  EpisodePubDateMsField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EpisodePubDateMsField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EpisodePubDateMsField>() : json.map((value) => new EpisodePubDateMsField.fromJson(value)).toList();
  }

  static Map<String, EpisodePubDateMsField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EpisodePubDateMsField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EpisodePubDateMsField.fromJson(value));
    }
    return map;
  }
}
