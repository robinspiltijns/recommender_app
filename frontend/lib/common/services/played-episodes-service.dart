import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';

Future<List<Episode>> getPlayedEpisodes() async {
  // Only async if database has not been initialized yet.
  return DatabaseHelper()
      .database.then((database) =>
        database.query(
            DatabaseHelper.playedEpisodesTable,
            orderBy: DatabaseHelper.playedDateColumn
        ).then((list) =>
            list.map((response) =>
                Episode.fromDatabaseMap(response)
            ).toList()
        )
  );

}

Future<bool> isPlayed(String id) {
  return DatabaseHelper()
      .database.then((database) =>
        database.query(
          DatabaseHelper.playedEpisodesTable,
          columns: ["COUNT (*)"],
          where: "${DatabaseHelper.idColumn} = ?",
          whereArgs: [id]
        ).then((result) =>
          result.isNotEmpty
        )
      );
}

void insertPlayedEpisode(Episode episode) {
  var entry = episode.toMap();
  entry.addAll(
      {DatabaseHelper.playedDateColumn: DateTime.now().toIso8601String()}
  );
  DatabaseHelper().database
      .then((database) =>
        database.insert(DatabaseHelper.playedEpisodesTable, entry
      )
    );

}
