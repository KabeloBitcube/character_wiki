class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String origin;
  final String location;
  final List<String> episodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      origin: json['origin']['name'],
      location: json['location']['name'],
      episodes: List<String>.from(json['episode']),
    );
  }
}
