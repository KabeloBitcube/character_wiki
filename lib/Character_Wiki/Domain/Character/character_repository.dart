import 'package:character_wiki/Character_Wiki/Domain/Character/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters ({String? name, String? status, String? species, String? gender});
}