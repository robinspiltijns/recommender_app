part of swagger.api;

class BestOfGenreResult {
  /* The id of this genre */
  int id = null;
/* This genre's name. */
  String name = null;

  int total = null;

  bool hasNext = null;

  List<Show> podcasts = [];
/* The id of parent genre. */
  int parentId = null;

  int pageNumber = null;

  bool hasPrevious = null;
/* Url of the list of best podcasts on [ListenNotes.com](https://www.ListenNotes.com). */
  String listennotesUrl = null;

  int nextPageNumber = null;

  int previousPageNumber = null;

  BestOfGenreResult();

  @override
  String toString() {
    return 'BestOfGenreResult[id=$id, name=$name, total=$total, hasNext=$hasNext, podcasts=$podcasts, parentId=$parentId, pageNumber=$pageNumber, hasPrevious=$hasPrevious, listennotesUrl=$listennotesUrl, nextPageNumber=$nextPageNumber, previousPageNumber=$previousPageNumber, ]';
  }

  BestOfGenreResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    total = json['total'];
    hasNext = json['has_next'];
    podcasts = Show.listFromJson(json['podcasts']);
    parentId = json['parent_id'];
    pageNumber = json['page_number'];
    hasPrevious = json['has_previous'];
    listennotesUrl = json['listennotes_url'];
    nextPageNumber = json['next_page_number'];
    previousPageNumber = json['previous_page_number'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'total': total,
      'has_next': hasNext,
      'podcasts': podcasts,
      'parent_id': parentId,
      'page_number': pageNumber,
      'has_previous': hasPrevious,
      'listennotes_url': listennotesUrl,
      'next_page_number': nextPageNumber,
      'previous_page_number': previousPageNumber
     };
  }

  static List<BestOfGenreResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<BestOfGenreResult>() : json.map((value) => new BestOfGenreResult.fromJson(value)).toList();
  }

  static Map<String, BestOfGenreResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BestOfGenreResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BestOfGenreResult.fromJson(value));
    }
    return map;
  }
}
