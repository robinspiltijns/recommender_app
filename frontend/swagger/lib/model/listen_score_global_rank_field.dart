part of swagger.api;

class ListenScoreGlobalRankField {
  
  ListenScoreGlobalRankField();

  @override
  String toString() {
    return 'ListenScoreGlobalRankField[]';
  }

  ListenScoreGlobalRankField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ListenScoreGlobalRankField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ListenScoreGlobalRankField>() : json.map((value) => new ListenScoreGlobalRankField.fromJson(value)).toList();
  }

  static Map<String, ListenScoreGlobalRankField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ListenScoreGlobalRankField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ListenScoreGlobalRankField.fromJson(value));
    }
    return map;
  }
}
