part of swagger.api;

class GetGenresResponse {
  
  List<Genre> genres = [];

  GetGenresResponse();

  @override
  String toString() {
    return 'GetGenresResponse[genres=$genres, ]';
  }

  GetGenresResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    genres = Genre.listFromJson(json['genres']);
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': genres
     };
  }

  static List<GetGenresResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<GetGenresResponse>() : json.map((value) => new GetGenresResponse.fromJson(value)).toList();
  }

  static Map<String, GetGenresResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GetGenresResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GetGenresResponse.fromJson(value));
    }
    return map;
  }
}
