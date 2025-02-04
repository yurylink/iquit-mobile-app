import 'dart:async';

import 'package:iquit/model/StreaksDurationModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfiguration {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 2;

  static final String STREAKS_TABLE = "streaks";

  DatabaseConfiguration._privateConstructor();

  static final DatabaseConfiguration instance =
  DatabaseConfiguration._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    print("Database created");
    return await openDatabase(
        path, version: _databaseVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    return db.execute(
      "CREATE TABLE $STREAKS_TABLE ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "beginDate TEXT, "
          "endDate TEXT, "
          "durationInSeconds INTEGER, "
          "durationInMinutes INTEGER, "
          "durationInHours INTEGER, "
          "durationInDays INTEGER, "
          "durationInMonths INTEGER, "
          "durationInYears INTEGER "
          ")",
    );
  }

  Future<int> insertStreak(StreaksDurationModel model) async {
    Database db = await instance.database;
    return db.insert(STREAKS_TABLE, model.toMapWithoutId());
  }

  Future<List<StreaksDurationModel>> getAllStreaks() async {
    Database db = await instance.database;
    List<StreaksDurationModel> resultList = new List();
    if (db.isOpen) {
      List<Map> resultMap = await db.query(STREAKS_TABLE,orderBy: "id DESC");
      if (resultMap.isNotEmpty) {
        resultMap.forEach((element) {
          print(element);
          resultList.add(StreaksDurationModel.fromMap(element));
        });
      }
    }
    return resultList;
  }
}
