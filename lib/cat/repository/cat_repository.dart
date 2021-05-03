import 'package:cats_weight_history/cat/dao/cat_dao.dart';
import 'package:cats_weight_history/cat/model/cat.dart';

class CatRepository {
  final CatDao catDao = CatDao();

  Future insertCat(Cat cat) => catDao.insertCat(cat);

  Future<dynamic> getAllBreeds() => catDao.getAllCats();
}