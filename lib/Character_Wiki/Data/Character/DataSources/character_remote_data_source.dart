// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:character_wiki/Character_Wiki/Data/Character/Models/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSource({required this.client});

  Future<List<CharacterModel>> getCharacters() async {
    final uri = Uri.parse('https://rickandmortyapi.com/api/character');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception(
        'Failed to load characters: Status ${response.statusCode}',
      );
    }
  }
}
