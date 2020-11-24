part of swagger.api;

class AudioLengthSecField {
  
  AudioLengthSecField();

  @override
  String toString() {
    return 'AudioLengthSecField[]';
  }

  AudioLengthSecField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<AudioLengthSecField> listFromJson(List<dynamic> json) {
    return json == null ? new List<AudioLengthSecField>() : json.map((value) => new AudioLengthSecField.fromJson(value)).toList();
  }

  static Map<String, AudioLengthSecField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AudioLengthSecField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AudioLengthSecField.fromJson(value));
    }
    return map;
  }
}
