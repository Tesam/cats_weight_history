import 'package:cats_weight_history/breed/dao/breed_dao.dart';
import 'package:cats_weight_history/breed/model/breed.dart';

class BreedRepository {
  final breedDao = BreedDao();

  Future insertBreed(Breed breed) => breedDao.insertBreed(breed);

  Future<dynamic> getAllBreeds() => breedDao.getAllBreeds();

  Future updateBreed(Breed breed) => breedDao.updateBreed(breed);

  Future deleteBreed(int id) => breedDao.deleteBreed(id);
}