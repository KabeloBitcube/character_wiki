// ignore_for_file: public_member_api_docs, sort_constructors_first
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String origin;
  final String location;
  final List<String> epsiodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.epsiodes,
  });

  factory CharacterModel.fromJson (Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'], 
      name: json['name'], 
      status: json['status'], 
      species: json['species'], 
      gender: json['gender'], 
      image: json['image'], 
      origin: json['origin'], 
      location: json['location'], 
      epsiodes: List<String>.from(json['epsidoes'])
      );
  }
}
