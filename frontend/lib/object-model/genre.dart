import 'package:swagger/api.dart';

class OwnGenre {

  final int id;
  final String name;

  OwnGenre(this.id, this.name);

  static List<OwnGenre> fromGetGenreResponse(GetGenresResponse getGenresResponse) {
    List<Genre> list = getGenresResponse.genres;
    List<OwnGenre> result = [];
    for (var genre in list) {
      result.add(OwnGenre(genre.id, genre.name));
    }
    return result;
  }

}
