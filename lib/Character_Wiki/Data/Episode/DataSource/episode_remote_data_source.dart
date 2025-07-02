// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:character_wiki/Character_Wiki/Data/Episode/Model/episode_model.dart';
import 'package:http/http.dart' as http;

class EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSource({
    required this.client,
  });

  Future<List<EpisodeModel>> getEpisodes () async {
    final uri = Uri.parse('https://rickandmortyapi.com/api/episode');
    final response = await client.get(uri);

    if (response.statusCode == 200){
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => EpisodeModel.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load episodes: Status ${response.statusCode}');
    }
  }
}
