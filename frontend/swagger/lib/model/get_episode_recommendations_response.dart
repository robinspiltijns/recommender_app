part of swagger.api;

class GetEpisodeRecommendationsResponse {
  
  List<EpisodeSimple> recommendations = [];

  GetEpisodeRecommendationsResponse();

  @override
  String toString() {
    return 'GetEpisodeRecommendationsResponse[recommendations=$recommendations, ]';
  }

  GetEpisodeRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    recommendations = EpisodeSimple.listFromJson(json['recommendations']);
  }

  Map<String, dynamic> toJson() {
    return {
      'recommendations': recommendations
     };
  }

  static List<GetEpisodeRecommendationsResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<GetEpisodeRecommendationsResponse>() : json.map((value) => new GetEpisodeRecommendationsResponse.fromJson(value)).toList();
  }

  static Map<String, GetEpisodeRecommendationsResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GetEpisodeRecommendationsResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GetEpisodeRecommendationsResponse.fromJson(value));
    }
    return map;
  }
}
