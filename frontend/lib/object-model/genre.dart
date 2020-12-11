import 'package:swagger/api.dart';

class Genre {

  static Map<int, String> genreNames = Map<int, String>();

  static Future<void> getGenreNames() async {
    var response = await DefaultApi().getGenres();
    response.genres.forEach((genre) {
      genreNames[genre.id] = genre.name;
    });
  }


  final int id;
  String name;

  Genre(this.id) {
    name = genreNames[id];
  }
}
