class Cat{
  int? id;
  final int breedId;
  final String cat;

  Cat({
    this.id,
    required this.breedId,
    required this.cat
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "breed_id": breedId,
      "cat": cat,
    };
  }
}