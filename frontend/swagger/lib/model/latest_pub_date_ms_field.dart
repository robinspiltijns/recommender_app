part of swagger.api;

class LatestPubDateMsField {
  
  LatestPubDateMsField();

  @override
  String toString() {
    return 'LatestPubDateMsField[]';
  }

  LatestPubDateMsField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<LatestPubDateMsField> listFromJson(List<dynamic> json) {
    return json == null ? new List<LatestPubDateMsField>() : json.map((value) => new LatestPubDateMsField.fromJson(value)).toList();
  }

  static Map<String, LatestPubDateMsField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LatestPubDateMsField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LatestPubDateMsField.fromJson(value));
    }
    return map;
  }
}
