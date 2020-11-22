part of swagger.api;

class ITunesIdField {
  
  ITunesIdField();

  @override
  String toString() {
    return 'ITunesIdField[]';
  }

  ITunesIdField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ITunesIdField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ITunesIdField>() : json.map((value) => new ITunesIdField.fromJson(value)).toList();
  }

  static Map<String, ITunesIdField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ITunesIdField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ITunesIdField.fromJson(value));
    }
    return map;
  }
}
