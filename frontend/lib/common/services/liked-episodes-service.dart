import 'package:flutter/cupertino.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class LikedEpisodesService extends ChangeNotifier {
  final Database database;

  LikedEpisodesService(this.database);

  Future<List<Episode>> getLikedEpisodes() {
    return database
        .query(DatabaseHelper.likedEpisodesTable)
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
            where: "$DatabaseHelper.idColumn = ?",
            whereArgs: [id])
        .then((result) => result.isNotEmpty);
  }

  void insertLikedEpisode(Episode episode) {
    database
        .insert(DatabaseHelper.likedEpisodesTable, episode.toMap())
        .then((_) => notifyListeners());
  }

  void deleteLikedEpisode(String id) {
    database
        .delete(DatabaseHelper.likedEpisodesTable,
            where: "$DatabaseHelper.idColumn = ?",
            whereArgs: [id])
        .then((_) => notifyListeners());
  }
}
