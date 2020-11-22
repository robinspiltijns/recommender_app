part of swagger.api;

class LanguageField {
  
  LanguageField();

  @override
  String toString() {
    return 'LanguageField[]';
  }

  LanguageField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<LanguageField> listFromJson(List<dynamic> json) {
    return json == null ? new List<LanguageField>() : json.map((value) => new LanguageField.fromJson(value)).toList();
  }

  static Map<String, LanguageField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LanguageField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LanguageField.fromJson(value));
    }
    return map;
  }
}
