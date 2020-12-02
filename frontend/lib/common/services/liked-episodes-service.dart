import 'package:flutter/cupertino.dart';
import 'package:frontend/common/services/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class LikedEpisodesService extends ChangeNotifier {

  Database database;

  LikedEpisodesService() {
    initDb();
  }

  initDb() async {
    database = await DbHelper().db;
  }

  Future<void> insert(Episode episode) async {
    await database.query("""
      
    """);
  }

}