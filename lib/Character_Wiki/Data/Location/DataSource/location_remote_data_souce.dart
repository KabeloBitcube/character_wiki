// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:character_wiki/Character_Wiki/Data/Location/Model/location_model.dart';
import 'package:http/http.dart' as http;

class LocationRemoteDataSouce {
  final http.Client client;

  LocationRemoteDataSouce({
    required this.client,
  });

  Future<List<LocationModel>> getLocations () async {
    final uri = Uri.parse('https://rickandmortyapi.com/api/location');
    final response = await client.get(uri);

    if (response.statusCode == 200){
      final jsonBody = await json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => LocationModel.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load locations: Status ${response.statusCode}');
    }
  }
}
