import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

import '../../db-helper.dart';

class QueueService extends ChangeNotifier {
  final Database database;

  QueueService(this.database);

  Future<List<Episode>> getQueuedEpisodes() {
    return database.query(DatabaseHelper.queueTable).then((list) {
      return list.map((response) => Episode.fromDatabaseMap(response)).toList();
    });
  }

  void insertQueuedEpisode(Episode episode) {
    var entry = episode.toMap();
    entry.addAll({DatabaseHelper.orderNumberColumn: 0});
    database
        .insert(DatabaseHelper.queueTable, entry)
        .then((_) => notifyListeners());
  }
}
