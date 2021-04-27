import 'dart:async';

import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final BreedRepository _breedRepository = BreedRepository();
  final StreamController _breedsController = new StreamController<List<Breed>>();
  Stream<List<Breed>> get breeds => _breedsController.stream;

  BreedBloc() {
    getBreeds();
  }

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);
  }

  Future<Stream<List<Breed>>> getBreeds() async {
    List<Breed> breedList = await _breedRepository.getAllBreeds();
    _breedsController.add(breedList);

    return _breedsController.stream;
  }

  dispose(){
    _breedsController.close();
  }

}