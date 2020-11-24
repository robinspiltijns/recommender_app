part of swagger.api;

class Genre {
  /* Genre id */
  int id = null;
/* Genre name. */
  String name = null;
/* Parent genre id. */
  int parentId = null;

  Genre();

  @override
  String toString() {
    return 'Genre[id=$id, name=$name, parentId=$parentId, ]';
  }

  Genre.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parent_id': parentId
     };
  }

  static List<Genre> listFromJson(List<dynamic> json) {
    return json == null ? new List<Genre>() : json.map((value) => new Genre.fromJson(value)).toList();
  }

  static Map<String, Genre> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Genre>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Genre.fromJson(value));
    }
    return map;
  }
}
