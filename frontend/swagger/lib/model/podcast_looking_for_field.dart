part of swagger.api;

class PodcastLookingForField {
  /* Whether this podcast is looking for cohosts. */
  bool cohosts = null;
/* Whether this podcast is looking for cross promotion opportunities with other podcasts. */
  bool crossPromotion = null;
/* Whether this podcast is looking for sponsors. */
  bool sponsors = null;
/* Whether this podcast is looking for guests. */
  bool guests = null;

  PodcastLookingForField();

  @override
  String toString() {
    return 'PodcastLookingForField[cohosts=$cohosts, crossPromotion=$crossPromotion, sponsors=$sponsors, guests=$guests, ]';
  }

  PodcastLookingForField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    cohosts = json['cohosts'];
    crossPromotion = json['cross_promotion'];
    sponsors = json['sponsors'];
    guests = json['guests'];
  }

  Map<String, dynamic> toJson() {
    return {
      'cohosts': cohosts,
      'cross_promotion': crossPromotion,
      'sponsors': sponsors,
      'guests': guests
     };
  }

  static List<PodcastLookingForField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastLookingForField>() : json.map((value) => new PodcastLookingForField.fromJson(value)).toList();
  }

  static Map<String, PodcastLookingForField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastLookingForField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastLookingForField.fromJson(value));
    }
    return map;
  }
}
