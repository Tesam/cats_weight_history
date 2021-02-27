class Breed{
  final int id;
  final String breed;

  Breed({this.id, this.breed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'breed': breed,
    };
  }
}