import 'package:flutter/cupertino.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class LikedEpisodesService extends ChangeNotifier {

  Database database;

  LikedEpisodesService(this.database) {
    testDatabase();
  }

  void testDatabase() async {



    var result = await database.query(DatabaseHelper.likedEpisodesTable);
    if (result.isEmpty) {
      print("empty!");
      Episode episode = Episode(
          "test",
          "test",
          "test",
          Duration(seconds: 4),
          Duration(seconds: 4),
          "test", "test", "test", DateTime.now());

      await database.insert(DatabaseHelper.likedEpisodesTable, episode.toMap());
      print("inserted");
    } else {
      print(Episode.fromDatabaseMap(result[0]));
    }


  }



}