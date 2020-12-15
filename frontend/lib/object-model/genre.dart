import 'package:swagger/api.dart';

class OwnGenre {

  static Map<int, String> genreNames = Map<int, String>();

  static Future<void> getGenreNames() async {
    var response = await DefaultApi().getGenres();
    response.genres.forEach((genre) {
      genreNames[genre.id] = genre.name;
    });
  }

  OwnGenre(this.id, this.name);

  static List<OwnGenre> fromGetGenreResponse(GetGenresResponse getGenresResponse) {
    List<Genre> list = getGenresResponse.genres;
    List<OwnGenre> result = [];
    for (var genre in list) {
      result.add(OwnGenre(genre.id, genre.name));
    }
    return result;
  }


  final int id;
  String name;

  Genre(this.id) {
    name = genreNames[id];
  }
}
