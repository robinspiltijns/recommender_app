import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper; //SINGLETON DBHELPER
  DatabaseHelper._createInstance(); //NAMED CONST TO CREATE INSTANCE OF THE DBHELPER


  static final String likedEpisodesTable = "liked_episodes";

  static final String idColumn = "id";
  static final String titleColumn = "title";
  static final String imageColumn = "image_url";
  static final String durationColumn = "duration";
  static final String positionColumn = "position";
  static final String publisherColumn = "publisher";
  static final String podcastIdColumn = "podcast_id";
  static final String descriptionColumn = "description";
  static final String publishDateColumn = "publish_date";
  static final String likedDateColumn = "liked_date";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); //EXEC ONLY ONCE (SINGLETON OBJ)
    }
    return _databaseHelper;
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

    // Uncomment this line to reset database when changes are done in _createDb().
    //await deleteDatabase(path);

    //OPEN/CREATE THE DB AT A GIVEN PATH
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        """
         CREATE TABLE IF NOT EXISTS $likedEpisodesTable(
            $idColumn TEXT PRIMARY KEY, 
            $titleColumn TEXT, 
            $imageColumn TEXT,
            $durationColumn INTEGER,
            $positionColumn INTEGER,
            $publisherColumn TEXT,
            $podcastIdColumn TEXT,
            $descriptionColumn TEXT,
            $publishDateColumn TEXT,
            $likedDateColumn TEXT
       )
       """
    );
  }}