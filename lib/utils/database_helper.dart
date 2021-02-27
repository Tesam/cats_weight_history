import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  static String _dbName = "cats.db";

  /* This create sentences order must be respected, to avoid sql syntax errors
  1°- Tables without foreign keys
  2°- Tables with foreign keys
  */
  static String _breedCreateSql = '''
  CREATE TABLE IF NOT EXISTS breed( 
    id integer, 
    breed text NOT NULL, 
    breed text NOT NULL, 
    PRIMARY KEY(id AUTOINCREMENT)
  ); 
  ''';

  static String _catCreateSql = '''
  CREATE TABLE IF NOT EXISTS cat( 
    id INTEGER, 
    cat TEXT, 
    breed_id INTEGER, 
    PRIMARY KEY(id AUTOINCREMENT), 
    FOREIGN KEY(breed_id) REFERENCES breed (id)
  ); 
  ''';

  static String _weightHistoryCreateSql = '''
  CREATE TABLE IF NOT EXISTS weight_history ( 
    id INTEGER, 
    cat_id INTEGER, 
    current_weight REAL, 
    FOREIGN KEY(cat_id) REFERENCES cat(id), 
    PRIMARY KEY(id AUTOINCREMENT) 
  ); 
  ''';

  static String _weightHistoryDetailCreateSql = '''
  CREATE TABLE IF NOT EXISTS weight_history_detail ( 
    id INTEGER, 
    weight REAL, 
    weight_date DATE, 
    weight_history_id INTEGER, 
    FOREIGN KEY(weight_history_id) REFERENCES weight_history(id), 
    PRIMARY KEY(id AUTOINCREMENT) 
  );        
  ''';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> initializeDatabase() async {
    var database;
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "assets/db/" + _dbName);

    // Should happen only the first time you launch your application
    print("Creating database tables");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    //Create tables
    database = await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
            $_breedCreateSql 
            $_catCreateSql
            $_weightHistoryCreateSql
            $_weightHistoryDetailCreateSql
            ''');
    });

    return database;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }
}
