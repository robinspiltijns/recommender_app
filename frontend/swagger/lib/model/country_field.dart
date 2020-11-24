part of swagger.api;

class CountryField {
  
  CountryField();

  @override
  String toString() {
    return 'CountryField[]';
  }

  CountryField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<CountryField> listFromJson(List<dynamic> json) {
    return json == null ? new List<CountryField>() : json.map((value) => new CountryField.fromJson(value)).toList();
  }

  static Map<String, CountryField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CountryField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CountryField.fromJson(value));
    }
    return map;
  }
}
