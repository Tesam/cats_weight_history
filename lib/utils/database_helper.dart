import 'dart:io';

import 'database_constants.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper!;
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    await db.execute('$breedCreateSql');
    await db.execute('$catCreateSql');
    await db.execute('$weightHistoryCreateSql');
    await db.execute('$weightHistoryDetailCreateSql');
  }

  Future<Database> initializeDatabase() async {
    var database;
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "assets/db/" + dbName);

    // Should happen only the first time you launch your application
    print("Creating database tables");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    //Create tables
    database = await openDatabase(path, version: 1, onCreate: (db, version) {
      return _onCreate(db,version);
    });

    return database;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }
}
