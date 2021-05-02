import 'package:cats_weight_history/utils/database_helper.dart';
import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/utils/database_constants.dart';

import 'package:sqflite/sqflite.dart';

class BreedDao {
  Future<void> insertBreed(Breed breed) async {
    final Database db = await DatabaseHelper().database;

    await db.insert(
      '$breedTableName',
      breed.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> getAllBreeds() async {
    final Database db = await DatabaseHelper().database;

    final List<Map<String, dynamic>> maps = await db.query('$breedTableName');

    return List.generate(maps.length, (i) {
      return Breed(
        id: maps[i]['id'],
        breed: maps[i]['breed'],
      );
    });
  }

  Future<void> updateBreed(Breed breed) async {
    final Database db = await DatabaseHelper().database;

    await db.update(
      '$breedTableName',
      breed.toMap(),
      where: "id = ?",
      whereArgs: [breed.id],
    );
  }

  Future<void> deleteBreed(int id) async {
    final Database db = await DatabaseHelper().database;

    await db.delete(
      '$breedTableName',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}