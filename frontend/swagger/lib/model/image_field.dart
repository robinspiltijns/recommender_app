part of swagger.api;

class ImageField {
  
  ImageField();

  @override
  String toString() {
    return 'ImageField[]';
  }

  ImageField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ImageField> listFromJson(List<dynamic> json) {
    return json == null ? new List<ImageField>() : json.map((value) => new ImageField.fromJson(value)).toList();
  }

  static Map<String, ImageField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ImageField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ImageField.fromJson(value));
    }
    return map;
  }
}
