import 'dart:async';

import 'package:cats_weight_history/cat/model/cat.dart';
import 'package:cats_weight_history/cat/repository/cat_repository.dart';

class CatBloc {
  final CatRepository _catRepository = CatRepository();
  final StreamController _catsController = new StreamController<List<Cat>>.broadcast();
  Stream<List<Cat>> get cats => _catsController.stream;

  final _addCatController = StreamController<Cat>.broadcast();
  StreamSink<Cat> get inAddCat => _addCatController.sink;

  CatBloc(){
    _addCatController.stream.listen(insertCat);
  }

  insertCat(Cat cat) async {
    await _catRepository.insertCat(cat);

    getCats();
  }

  Future<Stream<List<Cat>>> getCats() async {
    List<Cat> catList = await _catRepository.getAllCats();
    _catsController.add(catList);

    return _catsController.stream;
  }

  dispose(){
    _catsController.close();
    _addCatController.close();
  }
}