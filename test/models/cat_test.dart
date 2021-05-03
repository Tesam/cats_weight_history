import 'package:cats_weight_history/cat/model/cat.dart';
import 'package:test/test.dart';

void main(){
  group(
      "Cat model test",
          () {
        var cat = Cat(id: 1, breedId: 1, cat: "Cat");

        test(
            "Map the cat object",
                (){
              var catMap = cat.toMap();
              expect(catMap.toString(), "{id: 1, breed_id: 1, cat: Cat}");
            }
        );
      }
  );
}