import 'package:flutter/cupertino.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:sqflite/sqflite.dart';

// This class can be instantiated multiple times since the database is a singleton and all methods just access this database.
class SelectedGenresService extends ChangeNotifier {
  final Database database = DatabaseHelper().initializedDatabase;

  Future<List<Genre>> getSelectedGenres() {
    return database
        .query(DatabaseHelper.selectedGenresTable,
            orderBy: DatabaseHelper.idColumn)
        .then((list) =>
            list.map((response) => fromDatabaseMap(response)).toList());
  }

  Genre fromDatabaseMap(Map<String, dynamic> map) {
    return Genre(map[DatabaseHelper.idColumn], map[DatabaseHelper.nameColumn]);
  }

  Map<String, dynamic> toMap(Genre genre) {
    return <String, dynamic>{
      DatabaseHelper.nameColumn: genre.name,
      DatabaseHelper.idColumn: genre.id
    };
  }

  Future<bool> isSelectedGenre(String id) {
    return database
        .query(DatabaseHelper.selectedGenresTable,
            columns: ["COUNT (*)"],
            where: "${DatabaseHelper.idColumn} = ?",
            whereArgs: [id])
        .then((result) {
      return result[0]["COUNT (*)"] != 0;
    });
  }

  void insertSelectedGenre(Genre genre) {
    var entry = toMap(genre);
    database
        .insert(DatabaseHelper.selectedGenresTable, entry)
        .then((_) => notifyListeners());
  }
}
