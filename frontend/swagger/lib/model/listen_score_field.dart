part of swagger.api;

class ListenScoreField {
  
  ListenScoreField();

  @override
  String toString() {
    return 'ListenScoreField[]';
  }

  ListenScoreField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ListenScoreField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ListenScoreField>() : json.map((value) => new ListenScoreField.fromJson(value)).toList();
  }

  static Map<String, ListenScoreField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ListenScoreField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ListenScoreField.fromJson(value));
    }
    return map;
  }
}
