import 'package:cats_weight_history/breed/dao/breed_dao.dart';
import 'package:cats_weight_history/breed/model/breed.dart';

class BreedRepository {
  final breedDao = BreedDao();

  Future insertBreed(Breed breed) => breedDao.insertBreed(breed);
}