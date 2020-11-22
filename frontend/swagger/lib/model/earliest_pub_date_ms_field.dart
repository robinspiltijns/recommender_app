part of swagger.api;

class EarliestPubDateMsField {
  
  EarliestPubDateMsField();

  @override
  String toString() {
    return 'EarliestPubDateMsField[]';
  }

  EarliestPubDateMsField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EarliestPubDateMsField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EarliestPubDateMsField>() : json.map((value) => new EarliestPubDateMsField.fromJson(value)).toList();
  }

  static Map<String, EarliestPubDateMsField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EarliestPubDateMsField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EarliestPubDateMsField.fromJson(value));
    }
    return map;
  }
}
