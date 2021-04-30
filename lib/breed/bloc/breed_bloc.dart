import 'dart:async';

import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final BreedRepository _breedRepository = BreedRepository();
  final StreamController _breedsController = new StreamController<List<Breed>>.broadcast();
  Stream<List<Breed>> get breeds => _breedsController.stream;

  final _addBreedController = StreamController<Breed>.broadcast();
  StreamSink<Breed> get inAddBreed => _addBreedController.sink;

  BreedBloc() {
    getBreeds();
    _addBreedController.stream.listen(insertBreed);
  }

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);

    getBreeds();
  }

  Future<Stream<List<Breed>>> getBreeds() async {
    List<Breed> breedList = await _breedRepository.getAllBreeds();
    _breedsController.add(breedList);

    return _breedsController.stream;
  }

  dispose(){
    _breedsController.close();
    _addBreedController.close();
  }

}