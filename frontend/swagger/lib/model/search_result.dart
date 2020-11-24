part of swagger.api;

class SearchResult {
  /* Pass this value to the **offset** parameter to do pagination of search results. */
  int nextOffset = null;
/* The time it took to fetch these search results. In seconds. */
  double took = null;
/* The total number of search results. */
  int total = null;
/* The number of search results in this page. */
  int count = null;
/* A list of search results for episodes. */
  List<EpisodeSearchResult> episoderesults = [];
/* A list of search results for podcasts. */
  List<PodcastSearchResult> podcastresults = [];

  SearchResult();

  @override
  String toString() {
    return 'SearchResult[nextOffset=$nextOffset, took=$took, total=$total, count=$count, episoderesults=$episoderesults, podcastresults=$podcastresults, ]';
  }

  SearchResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    nextOffset = json['next_offset'];
    took = json['took'];
    total = json['total'];
    count = json['count'];
    episoderesults = EpisodeSearchResult.listFromJson(json['episoderesults']);
    podcastresults = PodcastSearchResult.listFromJson(json['podcastresults']);
  }

  Map<String, dynamic> toJson() {
    return {
      'next_offset': nextOffset,
      'took': took,
      'total': total,
      'count': count,
      'episoderesults': episoderesults,
      'podcastresults': podcastresults
     };
  }

  static List<SearchResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<SearchResult>() : json.map((value) => new SearchResult.fromJson(value)).toList();
  }

  static Map<String, SearchResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SearchResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SearchResult.fromJson(value));
    }
    return map;
  }
}
