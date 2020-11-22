part of swagger.api;

class BestPodcastsLNUrlField {
  
  BestPodcastsLNUrlField();

  @override
  String toString() {
    return 'BestPodcastsLNUrlField[]';
  }

  BestPodcastsLNUrlField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<BestPodcastsLNUrlField> listFromJson(List<dynamic> json) {
    return json == null ? new List<BestPodcastsLNUrlField>() : json.map((value) => new BestPodcastsLNUrlField.fromJson(value)).toList();
  }

  static Map<String, BestPodcastsLNUrlField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BestPodcastsLNUrlField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BestPodcastsLNUrlField.fromJson(value));
    }
    return map;
  }
}
