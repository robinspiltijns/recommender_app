import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class LikedEpisodesService extends ChangeNotifier {

  Database database;

  LikedEpisodesService(this.database);

}