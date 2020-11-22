part of swagger.api;

class CuratedSourceDomainField {
  
  CuratedSourceDomainField();

  @override
  String toString() {
    return 'CuratedSourceDomainField[]';
  }

  CuratedSourceDomainField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CuratedSourceDomainField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CuratedSourceDomainField>() : json.map((value) => new CuratedSourceDomainField.fromJson(value)).toList();
  }

  static Map<String, CuratedSourceDomainField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CuratedSourceDomainField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CuratedSourceDomainField.fromJson(value));
    }
    return map;
  }
}
