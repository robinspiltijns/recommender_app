part of swagger.api;

class TotalEpisodesField {
  
  TotalEpisodesField();

  @override
  String toString() {
    return 'TotalEpisodesField[]';
  }

  TotalEpisodesField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<TotalEpisodesField> listFromJson(List<dynamic> json) {
    return json == null ? new List<TotalEpisodesField>() : json.map((value) => new TotalEpisodesField.fromJson(value)).toList();
  }

  static Map<String, TotalEpisodesField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TotalEpisodesField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TotalEpisodesField.fromJson(value));
    }
    return map;
  }
}
