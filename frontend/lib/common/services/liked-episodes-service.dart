import 'package:flutter/cupertino.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:sqflite/sqflite.dart';

class LikedEpisodesService extends ChangeNotifier {
  final Database database;
  final SelectedGenresService selectedGenresService;

  LikedEpisodesService(this.database, this.selectedGenresService);

  Future<List<Episode>> getLikedEpisodes() {
    return database
        .query(DatabaseHelper.likedEpisodesTable,
          orderBy: DatabaseHelper.likedDateColumn)
        .then((list) =>
            list.map((response) =>
                Episode.fromDatabaseMap(response))
            .toList()
        );
  }

  Future<bool> isLiked(String id) {
    return database
        .query(DatabaseHelper.likedEpisodesTable,
            columns: ["COUNT (*)"],
            where: "${DatabaseHelper.idColumn} = ?",
            whereArgs: [id])
        .then((result) {
          return result[0]["COUNT (*)"] != 0;
        });
  }

  void insertLikedEpisode(Episode episode) {
    var entry = episode.toMap();
    entry.addAll(
        {DatabaseHelper.likedDateColumn: DateTime.now().toIso8601String()}
    );
    database
        .insert(DatabaseHelper.likedEpisodesTable, entry)
        .then((_) => notifyListeners());
  }

  void deleteLikedEpisode(String id) {
    database
        .delete(DatabaseHelper.likedEpisodesTable,
            where: "${DatabaseHelper.idColumn} = ?",
            whereArgs: [id])
        .then((_) => notifyListeners());
  }

  Future<List<Genre>> getMostLikedGenres() async {
    print("here");
    List<Episode> episodes = await this.getLikedEpisodes();
    Map<int, int> genreCount = Map<int, int>();

    for (Episode episode in episodes) {
      for (Genre genre in episode.genres) {
        if (genre.id != 67) {  // ignore genre "Podcast".
          if (genreCount.containsKey(genre.id)) {
            genreCount[genre.id]++;
          } else {
            genreCount[genre.id] = 1;
          }
        }
      }
    }

    // Sort retrieved genres by frequency
    var sortedKeys = genreCount.keys.toList(growable:false)
      ..sort((k1, k2) => genreCount[k1].compareTo(genreCount[k2]));

    List<Genre> result = sortedKeys.map((int id) => Genre.fromId(id))
        .toList();

    if (result.length < 4) {
      List<Genre> selectedGenres = await selectedGenresService.getSelectedGenres();
      result.addAll(selectedGenres.sublist(0, 4 - result.length));
    }

    print(result);
    return result;

  }
}
