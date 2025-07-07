// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Data/Character/DataSources/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/Entities/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/Repostories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Character>> getCharacters() async {
    final models = await remoteDataSource.getCharacters();

    return models
        .map(
          (model) => Character(
            id: model.id,
            name: model.name,
            status: model.status,
            species: model.species,
            gender: model.gender,
            image: model.image,
            origin: model.origin,
            location: model.location,
            epsiodes: model.episodes,
          ),
        )
        .toList();
  }
}
