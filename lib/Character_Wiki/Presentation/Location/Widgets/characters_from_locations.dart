// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharactersFromLocations extends StatelessWidget {
  final List<String> characterUrls;

  const CharactersFromLocations({super.key, required this.characterUrls});

  List<int> extractCharacterIds() {
    return characterUrls.map((url) => int.parse(url.split('/').last)).toList();
  }

  Future<List<dynamic>> fetchCharacters(List<int> ids) async {
    final idsString = ids.join(',');
    final uri = Uri.parse(
      'https://rickandmortyapi.com/api/character/$idsString',
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data is List ? data : [data];
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    final characterIds = extractCharacterIds();

    return FutureBuilder<List<dynamic>>(
      future: fetchCharacters(characterIds),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final characters = snapshot.data!;
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(character['image']),
                        radius: 30,
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 60,
                        child: Text(
                          character['name'],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No characters found.'),
          );
        }
      },
    );
  }
}
