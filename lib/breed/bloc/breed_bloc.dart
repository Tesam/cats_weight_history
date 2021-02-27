import 'dart:async';

import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final _breedRepository = BreedRepository();

  final _breedController = StreamController<List<Breed>>.broadcast();
  get breeds => _breedController.stream;

  BreedBloc(){
    getAllBreeds();
  }

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);
  }

  getAllBreeds() async{
    _breedController.sink.add(await _breedRepository.getAllBreeds());
  }

  dispose() {
    _breedController.close();
  }

}