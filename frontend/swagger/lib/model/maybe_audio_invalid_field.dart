part of swagger.api;

class MaybeAudioInvalidField {
  
  MaybeAudioInvalidField();

  @override
  String toString() {
    return 'MaybeAudioInvalidField[]';
  }

  MaybeAudioInvalidField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<MaybeAudioInvalidField> listFromJson(List<dynamic> json) {
    return json == null ? new List<MaybeAudioInvalidField>() : json.map((value) => new MaybeAudioInvalidField.fromJson(value)).toList();
  }

  static Map<String, MaybeAudioInvalidField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, MaybeAudioInvalidField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MaybeAudioInvalidField.fromJson(value));
    }
    return map;
  }
}
