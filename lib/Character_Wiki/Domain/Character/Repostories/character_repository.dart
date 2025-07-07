import 'package:character_wiki/Character_Wiki/Domain/Character/Entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters ();
}