import 'package:swagger/api.dart' as swagger;

class Genre {

  static Map<int, String> genreNames = Map<int, String>();

  static Future<void> getGenreNames() async {
    var response = await swagger.DefaultApi().getGenres();
    response.genres.forEach((genre) {
      genreNames[genre.id] = genre.name;
    });
  }

  Genre(this.id, this.name);

  static List<Genre> fromGetGenreResponse(swagger.GetGenresResponse getGenresResponse) {
    List<swagger.Genre> list = getGenresResponse.genres;
    List<Genre> result = [];
    for (var genre in list) {
      result.add(Genre(genre.id, genre.name));
    }
    return result;
  }


  final int id;
  String name;

  static Genre fromId(int id) {
    String name = genreNames[id];
    return Genre(id, name);
  }

}
