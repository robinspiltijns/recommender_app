part of swagger.api;

class EmailField {
  
  EmailField();

  @override
  String toString() {
    return 'EmailField[]';
  }

  EmailField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<EmailField> listFromJson(List<dynamic> json) {
    return json == null ? new List<EmailField>() : json.map((value) => new EmailField.fromJson(value)).toList();
  }

  static Map<String, EmailField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EmailField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EmailField.fromJson(value));
    }
    return map;
  }
}
