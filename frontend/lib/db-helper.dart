import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper; //SINGLETON DBHELPER
  DatabaseHelper._createInstance(); //NAMED CONST TO CREATE INSTANCE OF THE DBHELPER


  static String likedEpisodesTable = "liked_episodes";

  static String idColumn = "id";
  static String titleColumn = "title";
  static String imageColumn = "image_url";
  static String durationColumn = "duration";
  static String positionColumn = "position";
  static String publisherColumn = "publisher";
  static String podcastIdColumn = "podcast_id";
  static String descriptionColumn = "description";
  static String publishDateColumn = "publish_date";
  static String likedDateColumn = "liked_date";

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

    //OPEN/CREATE THE DB AT A GIVEN PATH
    var notesDatabase =
      await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        """
         DROP TABLE $likedEpisodesTable;
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