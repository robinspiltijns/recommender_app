part of swagger.api;

class GetPodcastRecommendationsResponse {
  
  List<PodcastSimple> recommendations = [];

  GetPodcastRecommendationsResponse();

  @override
  String toString() {
    return 'GetPodcastRecommendationsResponse[recommendations=$recommendations, ]';
  }

  GetPodcastRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    recommendations = PodcastSimple.listFromJson(json['recommendations']);
  }

  Map<String, dynamic> toJson() {
    return {
      'recommendations': recommendations
     };
  }

  static List<GetPodcastRecommendationsResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<GetPodcastRecommendationsResponse>() : json.map((value) => new GetPodcastRecommendationsResponse.fromJson(value)).toList();
  }

  static Map<String, GetPodcastRecommendationsResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GetPodcastRecommendationsResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GetPodcastRecommendationsResponse.fromJson(value));
    }
    return map;
  }
}
