import 'package:flutter/cupertino.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:sqflite/sqflite.dart';

class UserNameService extends ChangeNotifier {
  final Database database;

  UserNameService(this.database);

  Future<String> getUserName() {
    return database
        .query(DatabaseHelper.userNameTable,
        orderBy: DatabaseHelper.creationDateColumn)
        .then((list) =>
        list.map((response) =>
            fromDatabaseMap(response))
            .toList().last
    );
  }

  String fromDatabaseMap(Map<String, dynamic> map) {
    return map[DatabaseHelper.name];
  }

  Map<String, dynamic> toMap(String name, String creationDate) {
    return <String, dynamic>{
      DatabaseHelper.name: name,
      DatabaseHelper.creationDateColumn: creationDate
    };
  }

  Future<bool> hasName() {
    return database
        .query(DatabaseHelper.userNameTable,
        columns: ["COUNT (*)"],
        where: "${DatabaseHelper.name} = ?")
        .then((result) => result.isNotEmpty);
  }

  void addUserName(String name) {
    var creationDate = DateTime.now().toIso8601String();
    var entry = toMap(name, creationDate);
    database
        .insert(DatabaseHelper.userNameTable, entry)
        .then((_) => notifyListeners());
  }

}
