import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DbHelper {

  static final DbHelper _dbHelper = DbHelper._internal();
  static final dbVersion = 1;
  static Database _db;

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDB();
    }
    return _db;
  }

  Future<Database> initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'episodes.db'),
      onCreate: (db, version) {
        return db.execute(
            """
         CREATE TABLE IF NOT EXISTS liked_episodes(
            id TEXT PRIMARY KEY, 
            title TEXT, 
            image_url TEXT,
            duration INT,
            position INT,
            publisher TEXT,
            podcast_id TEXT,
            description TEXT,
            publish_date TEXT,
            ),
         """
        );
      },
      version: 1);
  }


}