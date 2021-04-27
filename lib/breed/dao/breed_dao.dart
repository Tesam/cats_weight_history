import 'package:cats_weight_history/utils/database_helper.dart';
import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cats_weight_history/utils/database_constants.dart';

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

}