import 'package:test/test.dart';
import 'package:cats_weight_history/breed/model/breed.dart';

void main(){
  group(
    "Breed model test",
      () {
        var breed = Breed(id: 1, breed: "Breed");

        test(
          "Map the breed object",
            (){
              var breedMap = breed.toMap();
              expect(breedMap.toString(), "{id: 1, breed: Breed}");
            }
        );
      }
  );
}