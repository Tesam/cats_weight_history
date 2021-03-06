import 'dart:async';

import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:cats_weight_history/breed/repository/breed_repository.dart';

class BreedBloc {
  final BreedRepository _breedRepository = BreedRepository();
  final StreamController _breedsController = new StreamController<List<Breed>>.broadcast();
  Stream<dynamic> get breeds => _breedsController.stream;

  final _addBreedController = StreamController<Breed>.broadcast();
  StreamSink<Breed> get inAddBreed => _addBreedController.sink;

  final _updateBreedController = StreamController<Breed>.broadcast();
  StreamSink<Breed> get inUpdateBreed => _updateBreedController.sink;

  final _deleteBreedController = StreamController<int>.broadcast();
  StreamSink<int> get inDeleteBreed => _deleteBreedController.sink;

  // This bool StreamController will be used to ensure we don't do anything
  // else until a breed is actually deleted from the database.
  final _deletedBreedController = StreamController<bool>.broadcast();
  StreamSink<bool> get inDeletedBreed => _deletedBreedController.sink;
  Stream<bool> get deleted => _deletedBreedController.stream;

  BreedBloc() {
    getBreeds();
    _addBreedController.stream.listen(insertBreed);
    _updateBreedController.stream.listen(updateBreed);
    _deleteBreedController.stream.listen(deleteBreed);
  }

  insertBreed(Breed breed) async {
    await _breedRepository.insertBreed(breed);

    getBreeds();
  }

  Future<Stream<dynamic>> getBreeds() async {
    List<Breed> breedList = await _breedRepository.getAllBreeds();
    _breedsController.add(breedList);

    return _breedsController.stream;
  }

  void updateBreed(Breed breed) async {
    await _breedRepository.updateBreed(breed);

    getBreeds();
  }

  deleteBreed(int id) async {
    await _breedRepository.deleteBreed(id);

    // Set this to true in order to ensure a breed is deleted
    // before doing anything else
    inDeletedBreed.add(true);

    getBreeds();
  }

  dispose(){
    _breedsController.close();
    _addBreedController.close();
    _deleteBreedController.close();
    _deletedBreedController.close();
    _updateBreedController.close();
  }

}