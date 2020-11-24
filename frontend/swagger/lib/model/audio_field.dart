part of swagger.api;

class AudioField {
  
  AudioField();

  @override
  String toString() {
    return 'AudioField[]';
  }

  AudioField.fromJson(Map<String, dynamic> json) {
    print(1);
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<AudioField> listFromJson(List<dynamic> json) {
    return json == null ? new List<AudioField>() : json.map((value) => new AudioField.fromJson(value)).toList();
  }

  static Map<String, AudioField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AudioField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AudioField.fromJson(value));
    }
    return map;
  }
}
