part of swagger.api;

class IsClaimedField {
  
  IsClaimedField();

  @override
  String toString() {
    return 'IsClaimedField[]';
  }

  IsClaimedField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<IsClaimedField> listFromJson(List<dynamic> json) {
    return json == null ? new List<IsClaimedField>() : json.map((value) => new IsClaimedField.fromJson(value)).toList();
  }

  static Map<String, IsClaimedField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, IsClaimedField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new IsClaimedField.fromJson(value));
    }
    return map;
  }
}
