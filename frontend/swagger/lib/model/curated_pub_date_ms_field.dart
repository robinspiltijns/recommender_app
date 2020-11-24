part of swagger.api;

class CuratedPubDateMsField {
  
  CuratedPubDateMsField();

  @override
  String toString() {
    return 'CuratedPubDateMsField[]';
  }

  CuratedPubDateMsField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CuratedPubDateMsField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedPubDateMsField>() : json.map((value) => new CuratedPubDateMsField.fromJson(value)).toList();
  }

  static Map<String, CuratedPubDateMsField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedPubDateMsField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedPubDateMsField.fromJson(value));
    }
    return map;
  }
}
