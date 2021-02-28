import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final _breedRepository = BreedRepository();

  get breeds =>  getAllBreeds();

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);
  }

  getAllBreeds() async {
    return await _breedRepository.getAllBreeds();
  }

}