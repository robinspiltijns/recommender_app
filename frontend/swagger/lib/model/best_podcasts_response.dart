part of swagger.api;

class BestPodcastsResponse {
  
  bool hasPrevious = null;
/* This genre's name. */
  String name = null;
/* Url of the list of best podcasts on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;

  int previousPageNumber = null;

  int pageNumber = null;

  bool hasNext = null;

  int nextPageNumber = null;
/* The id of parent genre. */
  int parentId = null;
/* The id of this genre */
  int id = null;

  int total = null;

  List<PodcastSimple> podcasts = [];

  BestPodcastsResponse();

  @override
  String toString() {
    return 'BestPodcastsResponse[hasPrevious=$hasPrevious, name=$name, listennotesUrl=$listennotesUrl, previousPageNumber=$previousPageNumber, pageNumber=$pageNumber, hasNext=$hasNext, nextPageNumber=$nextPageNumber, parentId=$parentId, id=$id, total=$total, podcasts=$podcasts, ]';
  }

  BestPodcastsResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    hasPrevious = json['has_previous'];
    name = json['name'];
    listennotesUrl = json['listennotes_url'];
    previousPageNumber = json['previous_page_number'];
    pageNumber = json['page_number'];
    hasNext = json['has_next'];
    nextPageNumber = json['next_page_number'];
    parentId = json['parent_id'];
    id = json['id'];
    total = json['total'];
    podcasts = PodcastSimple.listFromJson(json['podcasts']);
  }

  Map<String, dynamic> toJson() {
    return {
      'has_previous': hasPrevious,
      'name': name,
      'listennotes_url': listennotesUrl,
      'previous_page_number': previousPageNumber,
      'page_number': pageNumber,
      'has_next': hasNext,
      'next_page_number': nextPageNumber,
      'parent_id': parentId,
      'id': id,
      'total': total,
      'podcasts': podcasts
     };
  }

  static List<BestPodcastsResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<BestPodcastsResponse>() : json.map((value) => new BestPodcastsResponse.fromJson(value)).toList();
  }

  static Map<String, BestPodcastsResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BestPodcastsResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BestPodcastsResponse.fromJson(value));
    }
    return map;
  }
}
