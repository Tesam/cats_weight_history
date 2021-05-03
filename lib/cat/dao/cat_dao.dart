import 'package:cats_weight_history/cat/model/cat.dart';
import 'package:cats_weight_history/utils/database_constants.dart';
import 'package:cats_weight_history/utils/database_helper.dart';

import 'package:sqflite/sqflite.dart';

class CatDao {

  Future<void> insertCat(Cat cat) async {
    final Database db = await DatabaseHelper().database;

    await db.insert(
      "$catTableName",
      cat.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> getAllCats() async {
    final Database db = await DatabaseHelper().database;

    final List<Map<String, dynamic>> maps = await db.query("$catTableName");

    return List.generate(maps.length, (i) {
      return Cat(
        id: maps[i]["id"],
        breedId: maps[i]["breed_id"],
        cat: maps[i]["cat"],
      );
    });
  }

}