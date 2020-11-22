part of swagger.api;

class ShowLookingFor {
  /* Whether this podcast is looking for guests. */
  bool guests = null;
/* Whether this podcast is looking for cohosts. */
  bool cohosts = null;
/* Whether this podcast is looking for sponsors. */
  bool sponsors = null;
/* Whether this podcast is looking for cross promotion opportunities with other podcasts. */
  bool crossPromotion = null;

  ShowLookingFor();

  @override
  String toString() {
    return 'ShowLookingFor[guests=$guests, cohosts=$cohosts, sponsors=$sponsors, crossPromotion=$crossPromotion, ]';
  }

  ShowLookingFor.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    guests = json['guests'];
    cohosts = json['cohosts'];
    sponsors = json['sponsors'];
    crossPromotion = json['cross_promotion'];
  }

  Map<String, dynamic> toJson() {
    return {
      'guests': guests,
      'cohosts': cohosts,
      'sponsors': sponsors,
      'cross_promotion': crossPromotion
     };
  }

  static List<ShowLookingFor> listFromJson(List<dynamic> json) {
    return json == null ? new List<ShowLookingFor>() : json.map((value) => new ShowLookingFor.fromJson(value)).toList();
  }

  static Map<String, ShowLookingFor> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ShowLookingFor>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ShowLookingFor.fromJson(value));
    }
    return map;
  }
}
