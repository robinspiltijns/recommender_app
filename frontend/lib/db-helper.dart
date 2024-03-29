import 'dart:io';
import 'package:frontend/main.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper; //SINGLETON DBHELPER
  DatabaseHelper._createInstance(); //NAMED CONST TO CREATE INSTANCE OF THE DBHELPER

  static final String likedEpisodesTable = "liked_episodes";
  static final String queueTable = "queue";
  static final String idColumn = "id";
  static final String audioColumn = "audio";
  static final String titleColumn = "title";
  static final String imageColumn = "image_url";
  static final String durationColumn = "duration";
  static final String positionColumn = "position";
  static final String publisherColumn = "publisher";
  static final String podcastIdColumn = "podcast_id";
  static final String descriptionColumn = "description";
  static final String publishDateColumn = "publish_date";
  static final String genreIdsColumn = "genre_ids";

  static final String likedDateColumn = "liked_date";
  static final String playedDateColumn = "played_date";

  static final playedEpisodesTable = "played_episodes";
  static final String orderNumberColumn = "order_number";

  static final userNameTable = "user_name";
  static final String nameColumn = "name";
  static final String creationDateColumn = "creation_date";

  static final selectedGenresTable = "selected_genres";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); //EXEC ONLY ONCE (SINGLETON OBJ)
    }
    return _databaseHelper;
  }

  Database get initializedDatabase {
    return _database;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //GET THE PATH TO THE DIRECTORY FOR IOS AND ANDROID TO STORE DB
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "episodes.db";

    if (resetDatabase) {
      await deleteDatabase(path);
    }

    //OPEN/CREATE THE DB AT A GIVEN PATH
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        """
          CREATE TABLE IF NOT EXISTS $playedEpisodesTable(
            $idColumn TEXT, 
            $titleColumn TEXT, 
            $audioColumn TEXT,
            $imageColumn TEXT,
            $durationColumn INTEGER,
            $positionColumn INTEGER,
            $publisherColumn TEXT,
            $podcastIdColumn TEXT,
            $descriptionColumn TEXT,
            $playedDateColumn TEXT,
            $publishDateColumn TEXT,
            $genreIdsColumn TEXT
          )
        """
    );
    await db.execute(
        """
          CREATE TABLE IF NOT EXISTS $likedEpisodesTable(
             $idColumn TEXT,
             $titleColumn TEXT,
             $audioColumn TEXT,
             $imageColumn TEXT,
             $durationColumn INTEGER,
             $positionColumn INTEGER,
             $publisherColumn TEXT,
             $podcastIdColumn TEXT,
             $descriptionColumn TEXT,
             $publishDateColumn TEXT,
             $likedDateColumn TEXT,
             $genreIdsColumn TEXT
        );
      """);
    await db.execute("""
       CREATE TABLE IF NOT EXISTS $queueTable(
            $idColumn TEXT, 
            $titleColumn TEXT, 
            $audioColumn TEXT,
            $imageColumn TEXT,
            $durationColumn INTEGER,
            $positionColumn INTEGER,
            $publisherColumn TEXT,
            $podcastIdColumn TEXT,
            $descriptionColumn TEXT,
            $publishDateColumn TEXT,
            $orderNumberColumn INTEGER,
            $genreIdsColumn TEXT
       )
       """);
    await db.execute("""
       CREATE TABLE IF NOT EXISTS $userNameTable(
          $nameColumn TEXT, 
          $creationDateColumn INTEGER
       )
       """);
    await db.execute("""
       CREATE TABLE IF NOT EXISTS $selectedGenresTable(
          $nameColumn TEXT, 
          $idColumn INTEGER
       )
       """);

    print("table created");
  }
}
