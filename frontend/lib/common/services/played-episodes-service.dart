import 'package:flutter/cupertino.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class PlayedEpisodesService extends ChangeNotifier {
  final Database database;

  PlayedEpisodesService(this.database);

  Future<List<Episode>> getPlayedEpisodes() {
    return database
        .query(DatabaseHelper.playedEpisodesTable,
        orderBy: DatabaseHelper.playedDateColumn)
        .then((list) =>
        list.map((response) =>
            Episode.fromDatabaseMap(response))
            .toList()
    );
  }

  Future<bool> isPlayed(String id) {
    return database
        .query(DatabaseHelper.playedEpisodesTable,
        columns: ["COUNT (*)"],
        where: "${DatabaseHelper.idColumn} = ?",
        whereArgs: [id])
        .then((result) => result.isNotEmpty);
  }

  void insertPlayedEpisode(Episode episode) {
    print("-----------------------het insert de episode!-----------------------------------");
    var entry = episode.toMap();
    entry.addAll(
        {DatabaseHelper.playedDateColumn: DateTime.now().toIso8601String()}
    );
    database
        .insert(DatabaseHelper.playedEpisodesTable, entry)
        .then((_) => notifyListeners());
  }

}
