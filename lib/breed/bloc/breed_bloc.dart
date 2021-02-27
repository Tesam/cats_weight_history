import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final _breedRepository = BreedRepository();

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);
  }
}