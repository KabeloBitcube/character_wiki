// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Domain/Character/Entity/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/Repostories/character_repository.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters({required this.repository});

  Future<List<Character>> call() async {
    return repository.getCharacters();
  }
}
