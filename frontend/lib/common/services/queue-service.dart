import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';
import '../../db-helper.dart';

class QueueService extends ChangeNotifier {
  final Database database;
  List<Episode> _queue = [];

  QueueService(this.database) {
    _getPersistedQueue().then((newQueue) => _queue = newQueue);
  }

  List<Episode> get queue {
    return _queue;
  }

  Future<List<Episode>> _getPersistedQueue() {
    return database.query(DatabaseHelper.queueTable).then((list) {
      return list.map((response) => Episode.fromDatabaseMap(response)).toList();
    });
  }

  Future<void> setQueue(List<Episode> queue) async {
    // Ik maak hier een uitzondering door vroeger te notifyen maar het was nodig. We kunnen later mss reverten als de commit faalt.
    _queue = queue;
    notifyListeners();
    await database.delete(DatabaseHelper.queueTable);
    Batch batch = database.batch();
    queue.asMap().forEach((index, episode) {
      Map<String, dynamic> entry = episode.toMap();
      entry.addAll({DatabaseHelper.orderNumberColumn: index});
      batch.insert(DatabaseHelper.queueTable, entry);
    });
    await batch.commit(noResult: true);
  }

  Future<Episode> pop(int index) async {
    // I think this returns a new list, not 100% sure.
    List<Episode> newQueue = List.from(_queue);
    Episode episode = newQueue.removeAt(index);
    await setQueue(newQueue);
    return episode;
  }

  void addEpisode(Episode episode) {
    List<Episode> newQueue = List.from(_queue);
    newQueue.add(episode);
    setQueue(newQueue);
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    List<Episode> newQueue = List.from(_queue);
    Episode episodeToAdd = newQueue.removeAt(oldIndex);
    newQueue.insert(newIndex, episodeToAdd);
    setQueue(newQueue);
  }
}
