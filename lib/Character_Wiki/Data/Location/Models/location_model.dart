// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
      id: json['id'], 
      name: json['name'], 
      type: json['type'], 
      dimension: json['dimension'], 
      residents: List<String>.from(json['residents'])
      );
  }
}
