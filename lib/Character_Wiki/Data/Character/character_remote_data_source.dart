// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:character_wiki/Character_Wiki/Data/Character/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterRemoteDataSource {
  final http.Client client;
  
  CharacterRemoteDataSource({
    required this.client,
  });

  Future<List<CharacterModel>> getCharacters ({String? name, String? status, String? species, String? gender}) async {
    final queryParams = {
      'name' : name,
      'status' : status, 
      'species' : species,
      'gender' : gender
    };

    final uri = Uri.https('rickandmortyapi.com', '/api/character', queryParams);

    final response = await client.get(Uri.parse(uri.toString()));

    if (response.statusCode == 200){
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    }
    else{
      throw Exception('Failed to load characters');
    }
  }
}
