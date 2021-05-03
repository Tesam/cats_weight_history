class Breed{
  int? id;
  final String breed;

  Breed({
    this.id,
    required this.breed
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "breed": breed,
    };
  }
}